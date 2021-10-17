local defaults = {
  local defaults = self,
  name: 'jaeger',
  namespace: error 'must provide namespace',
  version: error 'must provide version',
  strategy: error 'must provide strategy',
  agentStrategy: error 'must provide agentStrategy strategy',
  storageType: error 'must provide storageType',
  elasticsearchVersion: '7.5.0',
  port: 8080,
  resources: {
    limits: { cpu: '500m', memory: '512Mi' },
    requests: { cpu: '100m', memory: '128Mi' },
  },
  elasticsearchResources: {
    requests: { cpu: '200m', memory: '1Gi' },
    limits: { memory: '1Gi' },
  },
  commonLabels:: {
    'app.kubernetes.io/name': 'jaeger',
    'app.kubernetes.io/version': defaults.version,
    'app.kubernetes.io/component': 'jaeger',
  },
  selectorLabels:: {
    [labelName]: defaults.commonLabels[labelName]
    for labelName in std.objectFields(defaults.commonLabels)
    if !std.setMember(labelName, ['app.kubernetes.io/version'])
  },
};

function(params) {
  local j = self,
  config:: defaults + params,

  assert j.config.strategy == 'production' ||
         j.config.strategy == 'streaming' ||
         j.config.strategy == 'allInOne' :
         'strategy must be one of ["production", "streaming", "allInOne"]',

  assert j.config.storageType == 'elasticsearch' ||
         j.config.storageType == 'cassandra' :
         'storage type must be one of ["elasticsearch", "cassandra"]',

  assert j.config.agentStrategy == 'DaemonSet' ||
         j.config.agentStrategy == 'sidecar' :
         'storage type must be one of ["DaemonSet", "sidecar"]',

  local storageSpec = if j.config.storageType == 'elasticsearch' then {
    storage: {
      type: 'elasticsearch',
      options: {
        es: {
          'server-urls': 'https://' + 'elastic-' + j.config.name + '-es-http:9200',
          tls: {
            ca: '/es/certificates/ca.crt',
          },
          'num-shards': 1,
          'num-replicas': 0,
        },
      },
      secretName: 'jaeger-secret',
    },
    volumeMounts: [{
      name: 'certificates',
      mountPath: '/es/certificates/',
      readOnly: true,
    }],
    volumes: [{
      name: 'certificates',
      secret: {
        secretName: 'elastic-' + j.config.name + '-es-http-certs-public',
      },
    }],
  } else {},

  jaeger: {
    apiVersion: 'jaegertracing.io/v1',
    kind: 'Jaeger',
    metadata: {
      name: j.config.name,
      namespace: j.config.namespace,
      labels: j.config.commonLabels,
    },
    spec: {
      agent: {
        strategy: j.config.agentStrategy,
      },
      strategy: j.config.strategy,
    } + storageSpec,
  },

  elasticsearchOperatorManifests: if j.config.storageType == 'elasticsearch' then {
    serviceAccount: {
      apiVersion: 'v1',
      kind: 'ServiceAccount',
      metadata: {
        name: 'elastic-operator',
        namespace: j.config.namespace,
        labels: j.config.commonLabels {
          'control-plane': 'elastic-operator',
          'app.kubernetes.io/version': '1.8.0',
        },
      },
    },

    secret: {
      apiVersion: 'v1',
      kind: 'Secret',
      metadata: {
        name: 'elastic-webhook-server-cert',
        namespace: j.config.namespace,
        labels: j.config.commonLabels {
          'control-plane': 'elastic-operator',
          'app.kubernetes.io/version': '1.8.0',
        },
      },
    },

    configMap: {
      apiVersion: 'v1',
      kind: 'ConfigMap',
      metadata: {
        name: 'elastic-operator',
        namespace: j.config.namespace,
        labels: j.config.commonLabels {
          'control-plane': 'elastic-operator',
          'app.kubernetes.io/version': '1.8.0',
        },
      },
      data: {
        'eck.yaml':
          |||
            log-verbosity: 0
            metrics-port: 0
            container-registry: docker.elastic.co
            max-concurrent-reconciles: 3
            ca-cert-validity: 8760h
            ca-cert-rotate-before: 24h
            cert-validity: 8760h
            cert-rotate-before: 24h
            set-default-security-context: true
            kube-client-timeout: 60s
            elasticsearch-client-timeout: 180s
            disable-telemetry: false
            validate-storage-class: true
            enable-webhook: true
            webhook-name: elastic-webhook.k8s.elastic.co
          |||,
      },
    },

    clusterRole: {
      apiVersion: 'rbac.authorization.k8s.io/v1',
      kind: 'ClusterRole',
      metadata: {
        name: 'elastic-operator',
        labels: j.config.commonLabels,
      },
      rules: [
        {
          apiGroups: [
            'authorization.k8s.io',
          ],
          resources: [
            'subjectaccessreviews',
          ],
          verbs: [
            'create',
          ],
        },
        {
          apiGroups: [
            '',
          ],
          resources: [
            'pods',
            'endpoints',
            'events',
            'persistentvolumeclaims',
            'secrets',
            'services',
            'configmaps',
            'serviceaccounts',
          ],
          verbs: [
            'get',
            'list',
            'watch',
            'create',
            'update',
            'patch',
            'delete',
          ],
        },
        {
          apiGroups: [
            'apps',
          ],
          resources: [
            'deployments',
            'statefulsets',
            'daemonsets',
          ],
          verbs: [
            'get',
            'list',
            'watch',
            'create',
            'update',
            'patch',
            'delete',
          ],
        },
        {
          apiGroups: [
            'policy',
          ],
          resources: [
            'poddisruptionbudgets',
          ],
          verbs: [
            'get',
            'list',
            'watch',
            'create',
            'update',
            'patch',
            'delete',
          ],
        },
        {
          apiGroups: [
            'elasticsearch.k8s.elastic.co',
          ],
          resources: [
            'elasticsearches',
            'elasticsearches/status',
            'elasticsearches/finalizers',
            'enterpriselicenses',
            'enterpriselicenses/status',
          ],
          verbs: [
            'get',
            'list',
            'watch',
            'create',
            'update',
            'patch',
            'delete',
          ],
        },
        {
          apiGroups: [
            'kibana.k8s.elastic.co',
          ],
          resources: [
            'kibanas',
            'kibanas/status',
            'kibanas/finalizers',
          ],
          verbs: [
            'get',
            'list',
            'watch',
            'create',
            'update',
            'patch',
            'delete',
          ],
        },
        {
          apiGroups: [
            'apm.k8s.elastic.co',
          ],
          resources: [
            'apmservers',
            'apmservers/status',
            'apmservers/finalizers',
          ],
          verbs: [
            'get',
            'list',
            'watch',
            'create',
            'update',
            'patch',
            'delete',
          ],
        },
        {
          apiGroups: [
            'enterprisesearch.k8s.elastic.co',
          ],
          resources: [
            'enterprisesearches',
            'enterprisesearches/status',
            'enterprisesearches/finalizers',
          ],
          verbs: [
            'get',
            'list',
            'watch',
            'create',
            'update',
            'patch',
            'delete',
          ],
        },
        {
          apiGroups: [
            'beat.k8s.elastic.co',
          ],
          resources: [
            'beats',
            'beats/status',
            'beats/finalizers',
          ],
          verbs: [
            'get',
            'list',
            'watch',
            'create',
            'update',
            'patch',
            'delete',
          ],
        },
        {
          apiGroups: [
            'agent.k8s.elastic.co',
          ],
          resources: [
            'agents',
            'agents/status',
            'agents/finalizers',
          ],
          verbs: [
            'get',
            'list',
            'watch',
            'create',
            'update',
            'patch',
            'delete',
          ],
        },
        {
          apiGroups: [
            'maps.k8s.elastic.co',
          ],
          resources: [
            'elasticmapsservers',
            'elasticmapsservers/status',
            'elasticmapsservers/finalizers',
          ],
          verbs: [
            'get',
            'list',
            'watch',
            'create',
            'update',
            'patch',
            'delete',
          ],
        },
        {
          apiGroups: [
            'storage.k8s.io',
          ],
          resources: [
            'storageclasses',
          ],
          verbs: [
            'get',
            'list',
            'watch',
          ],
        },
        {
          apiGroups: [
            'admissionregistration.k8s.io',
          ],
          resources: [
            'mutatingwebhookconfigurations',
            'validatingwebhookconfigurations',
          ],
          verbs: [
            'get',
            'list',
            'watch',
            'create',
            'update',
            'patch',
            'delete',
          ],
        },
      ],
    },

    clusterRoleView: {
      apiVersion: 'rbac.authorization.k8s.io/v1',
      kind: 'ClusterRole',
      metadata: {
        name: 'elastic-operator-view',
        labels: {
          'rbac.authorization.k8s.io/aggregate-to-view': 'true',
          'rbac.authorization.k8s.io/aggregate-to-edit': 'true',
          'rbac.authorization.k8s.io/aggregate-to-admin': 'true',
        } + j.config.commonLabels,
      },
      rules: [
        {
          apiGroups: [
            'elasticsearch.k8s.elastic.co',
          ],
          resources: [
            'elasticsearches',
          ],
          verbs: [
            'get',
            'list',
            'watch',
          ],
        },
        {
          apiGroups: [
            'apm.k8s.elastic.co',
          ],
          resources: [
            'apmservers',
          ],
          verbs: [
            'get',
            'list',
            'watch',
          ],
        },
        {
          apiGroups: [
            'kibana.k8s.elastic.co',
          ],
          resources: [
            'kibanas',
          ],
          verbs: [
            'get',
            'list',
            'watch',
          ],
        },
        {
          apiGroups: [
            'enterprisesearch.k8s.elastic.co',
          ],
          resources: [
            'enterprisesearches',
          ],
          verbs: [
            'get',
            'list',
            'watch',
          ],
        },
        {
          apiGroups: [
            'beat.k8s.elastic.co',
          ],
          resources: [
            'beats',
          ],
          verbs: [
            'get',
            'list',
            'watch',
          ],
        },
        {
          apiGroups: [
            'agent.k8s.elastic.co',
          ],
          resources: [
            'agents',
          ],
          verbs: [
            'get',
            'list',
            'watch',
          ],
        },
        {
          apiGroups: [
            'maps.k8s.elastic.co',
          ],
          resources: [
            'elasticmapsservers',
          ],
          verbs: [
            'get',
            'list',
            'watch',
          ],
        },
      ],
    },

    clusterRoleEdit: {
      apiVersion: 'rbac.authorization.k8s.io/v1',
      kind: 'ClusterRole',
      metadata: {
        name: 'elastic-operator-edit',
        labels: {
          'rbac.authorization.k8s.io/aggregate-to-edit': 'true',
          'rbac.authorization.k8s.io/aggregate-to-admin': 'true',
        } + j.config.commonLabels,
      },
      rules: [
        {
          apiGroups: [
            'elasticsearch.k8s.elastic.co',
          ],
          resources: [
            'elasticsearches',
          ],
          verbs: [
            'create',
            'delete',
            'deletecollection',
            'patch',
            'update',
          ],
        },
        {
          apiGroups: [
            'apm.k8s.elastic.co',
          ],
          resources: [
            'apmservers',
          ],
          verbs: [
            'create',
            'delete',
            'deletecollection',
            'patch',
            'update',
          ],
        },
        {
          apiGroups: [
            'kibana.k8s.elastic.co',
          ],
          resources: [
            'kibanas',
          ],
          verbs: [
            'create',
            'delete',
            'deletecollection',
            'patch',
            'update',
          ],
        },
        {
          apiGroups: [
            'enterprisesearch.k8s.elastic.co',
          ],
          resources: [
            'enterprisesearches',
          ],
          verbs: [
            'create',
            'delete',
            'deletecollection',
            'patch',
            'update',
          ],
        },
        {
          apiGroups: [
            'beat.k8s.elastic.co',
          ],
          resources: [
            'beats',
          ],
          verbs: [
            'create',
            'delete',
            'deletecollection',
            'patch',
            'update',
          ],
        },
        {
          apiGroups: [
            'agent.k8s.elastic.co',
          ],
          resources: [
            'agents',
          ],
          verbs: [
            'create',
            'delete',
            'deletecollection',
            'patch',
            'update',
          ],
        },
        {
          apiGroups: [
            'maps.k8s.elastic.co',
          ],
          resources: [
            'elasticmapsservers',
          ],
          verbs: [
            'create',
            'delete',
            'deletecollection',
            'patch',
            'update',
          ],
        },
      ],
    },

    clusterRoleBinding: {
      apiVersion: 'rbac.authorization.k8s.io/v1',
      kind: 'ClusterRoleBinding',
      metadata: {
        name: 'elastic-operator',
        labels: j.config.commonLabels,
      },
      roleRef: {
        apiGroup: 'rbac.authorization.k8s.io',
        kind: 'ClusterRole',
        name: 'elastic-operator',
      },
      subjects: [
        {
          kind: 'ServiceAccount',
          name: 'elastic-operator',
          namespace: j.config.namespace,
        },
      ],
    },

    service: {
      apiVersion: 'v1',
      kind: 'Service',
      metadata: {
        name: 'elastic-webhook-server',
        namespace: j.config.namespace,
        labels: j.config.commonLabels {
          'control-plane': 'elastic-operator',
          'app.kubernetes.io/version': '1.8.0',
        },
      },
      spec: {
        ports: [
          {
            name: 'https',
            port: 443,
            targetPort: 9443,
          },
        ],
        selector: {
          'control-plane': 'elastic-operator',
        },
      },
    },

    statefulset: {
      apiVersion: 'apps/v1',
      kind: 'StatefulSet',
      metadata: {
        name: 'elastic-operator',
        namespace: j.config.namespace,
        labels: j.config.commonLabels {
          'control-plane': 'elastic-operator',
          'app.kubernetes.io/version': '1.8.0',
        },
      },
      spec: {
        selector: {
          matchLabels: {
            'control-plane': 'elastic-operator',
          },
        },
        serviceName: 'elastic-operator',
        replicas: 1,
        template: {
          metadata: {
            annotations: {
              'co.elastic.logs/raw': '[{"type":"container","json.keys_under_root":true,"paths":["/var/log/containers/*${data.kubernetes.container.id}.log"],"processors":[{"convert":{"mode":"rename","ignore_missing":true,"fields":[{"from":"error","to":"_error"}]}},{"convert":{"mode":"rename","ignore_missing":true,"fields":[{"from":"_error","to":"error.message"}]}},{"convert":{"mode":"rename","ignore_missing":true,"fields":[{"from":"source","to":"_source"}]}},{"convert":{"mode":"rename","ignore_missing":true,"fields":[{"from":"_source","to":"event.source"}]}}]}]',
              'checksum/config': '032e84bdd1e85533291d73835756b3ef2b86d606c6281a446ad3703106703562',
            },
            labels: {
              'control-plane': 'elastic-operator',
            },
          },
          spec: {
            terminationGracePeriodSeconds: 10,
            serviceAccountName: 'elastic-operator',
            securityContext: {
              runAsNonRoot: true,
            },
            containers: [
              {
                image: 'docker.elastic.co/eck/eck-operator:1.8.0',
                imagePullPolicy: 'IfNotPresent',
                name: 'manager',
                args: [
                  'manager',
                  '--config=/conf/eck.yaml',
                  '--distribution-channel=all-in-one',
                ],
                env: [
                  {
                    name: 'OPERATOR_NAMESPACE',
                    valueFrom: {
                      fieldRef: {
                        fieldPath: 'metadata.namespace',
                      },
                    },
                  },
                  {
                    name: 'POD_IP',
                    valueFrom: {
                      fieldRef: {
                        fieldPath: 'status.podIP',
                      },
                    },
                  },
                  {
                    name: 'WEBHOOK_SECRET',
                    value: 'elastic-webhook-server-cert',
                  },
                ],
                resources: {
                  limits: {
                    cpu: 1,
                    memory: '512Mi',
                  },
                  requests: {
                    cpu: '100m',
                    memory: '150Mi',
                  },
                },
                ports: [
                  {
                    containerPort: 9443,
                    name: 'https-webhook',
                    protocol: 'TCP',
                  },
                ],
                volumeMounts: [
                  {
                    mountPath: '/conf',
                    name: 'conf',
                    readOnly: true,
                  },
                  {
                    mountPath: '/tmp/k8s-webhook-server/serving-certs',
                    name: 'cert',
                    readOnly: true,
                  },
                ],
              },
            ],
            volumes: [
              {
                name: 'conf',
                configMap: {
                  name: 'elastic-operator',
                },
              },
              {
                name: 'cert',
                secret: {
                  defaultMode: 420,
                  secretName: 'elastic-webhook-server-cert',
                },
              },
            ],
          },
        },
      },
    },

    validatingwebhookconfigurations: {
      apiVersion: 'admissionregistration.k8s.io/v1',
      kind: 'ValidatingWebhookConfiguration',
      metadata: {
        name: 'elastic-webhook.k8s.elastic.co',
        labels: j.config.commonLabels {
          'control-plane': 'elastic-operator',
          'app.kubernetes.io/version': '1.8.0',
        },
      },
      webhooks: [
        {
          clientConfig: {
            caBundle: 'Cg==',
            service: {
              name: 'elastic-webhook-server',
              namespace: j.config.namespace,
              path: '/validate-agent-k8s-elastic-co-v1alpha1-agent',
            },
          },
          failurePolicy: 'Ignore',
          name: 'elastic-agent-validation-v1alpha1.k8s.elastic.co',
          matchPolicy: 'Exact',
          admissionReviewVersions: [
            'v1beta1',
          ],
          sideEffects: 'None',
          rules: [
            {
              apiGroups: [
                'agent.k8s.elastic.co',
              ],
              apiVersions: [
                'v1alpha1',
              ],
              operations: [
                'CREATE',
                'UPDATE',
              ],
              resources: [
                'agents',
              ],
            },
          ],
        },
        {
          clientConfig: {
            caBundle: 'Cg==',
            service: {
              name: 'elastic-webhook-server',
              namespace: j.config.namespace,
              path: '/validate-apm-k8s-elastic-co-v1-apmserver',
            },
          },
          failurePolicy: 'Ignore',
          name: 'elastic-apm-validation-v1.k8s.elastic.co',
          matchPolicy: 'Exact',
          admissionReviewVersions: [
            'v1beta1',
          ],
          sideEffects: 'None',
          rules: [
            {
              apiGroups: [
                'apm.k8s.elastic.co',
              ],
              apiVersions: [
                'v1',
              ],
              operations: [
                'CREATE',
                'UPDATE',
              ],
              resources: [
                'apmservers',
              ],
            },
          ],
        },
        {
          clientConfig: {
            caBundle: 'Cg==',
            service: {
              name: 'elastic-webhook-server',
              namespace: j.config.namespace,
              path: '/validate-apm-k8s-elastic-co-v1beta1-apmserver',
            },
          },
          failurePolicy: 'Ignore',
          name: 'elastic-apm-validation-v1beta1.k8s.elastic.co',
          matchPolicy: 'Exact',
          admissionReviewVersions: [
            'v1beta1',
          ],
          sideEffects: 'None',
          rules: [
            {
              apiGroups: [
                'apm.k8s.elastic.co',
              ],
              apiVersions: [
                'v1beta1',
              ],
              operations: [
                'CREATE',
                'UPDATE',
              ],
              resources: [
                'apmservers',
              ],
            },
          ],
        },
        {
          clientConfig: {
            caBundle: 'Cg==',
            service: {
              name: 'elastic-webhook-server',
              namespace: j.config.namespace,
              path: '/validate-beat-k8s-elastic-co-v1beta1-beat',
            },
          },
          failurePolicy: 'Ignore',
          name: 'elastic-beat-validation-v1beta1.k8s.elastic.co',
          matchPolicy: 'Exact',
          admissionReviewVersions: [
            'v1beta1',
          ],
          sideEffects: 'None',
          rules: [
            {
              apiGroups: [
                'beat.k8s.elastic.co',
              ],
              apiVersions: [
                'v1beta1',
              ],
              operations: [
                'CREATE',
                'UPDATE',
              ],
              resources: [
                'beats',
              ],
            },
          ],
        },
        {
          clientConfig: {
            caBundle: 'Cg==',
            service: {
              name: 'elastic-webhook-server',
              namespace: j.config.namespace,
              path: '/validate-enterprisesearch-k8s-elastic-co-v1-enterprisesearch',
            },
          },
          failurePolicy: 'Ignore',
          name: 'elastic-ent-validation-v1.k8s.elastic.co',
          matchPolicy: 'Exact',
          admissionReviewVersions: [
            'v1beta1',
          ],
          sideEffects: 'None',
          rules: [
            {
              apiGroups: [
                'enterprisesearch.k8s.elastic.co',
              ],
              apiVersions: [
                'v1',
              ],
              operations: [
                'CREATE',
                'UPDATE',
              ],
              resources: [
                'enterprisesearches',
              ],
            },
          ],
        },
        {
          clientConfig: {
            caBundle: 'Cg==',
            service: {
              name: 'elastic-webhook-server',
              namespace: j.config.namespace,
              path: '/validate-enterprisesearch-k8s-elastic-co-v1beta1-enterprisesearch',
            },
          },
          failurePolicy: 'Ignore',
          name: 'elastic-ent-validation-v1beta1.k8s.elastic.co',
          matchPolicy: 'Exact',
          admissionReviewVersions: [
            'v1beta1',
          ],
          sideEffects: 'None',
          rules: [
            {
              apiGroups: [
                'enterprisesearch.k8s.elastic.co',
              ],
              apiVersions: [
                'v1beta1',
              ],
              operations: [
                'CREATE',
                'UPDATE',
              ],
              resources: [
                'enterprisesearches',
              ],
            },
          ],
        },
        {
          clientConfig: {
            caBundle: 'Cg==',
            service: {
              name: 'elastic-webhook-server',
              namespace: j.config.namespace,
              path: '/validate-elasticsearch-k8s-elastic-co-v1-elasticsearch',
            },
          },
          failurePolicy: 'Ignore',
          name: 'elastic-es-validation-v1.k8s.elastic.co',
          matchPolicy: 'Exact',
          admissionReviewVersions: [
            'v1beta1',
          ],
          sideEffects: 'None',
          rules: [
            {
              apiGroups: [
                'elasticsearch.k8s.elastic.co',
              ],
              apiVersions: [
                'v1',
              ],
              operations: [
                'CREATE',
                'UPDATE',
              ],
              resources: [
                'elasticsearches',
              ],
            },
          ],
        },
        {
          clientConfig: {
            caBundle: 'Cg==',
            service: {
              name: 'elastic-webhook-server',
              namespace: j.config.namespace,
              path: '/validate-elasticsearch-k8s-elastic-co-v1beta1-elasticsearch',
            },
          },
          failurePolicy: 'Ignore',
          name: 'elastic-es-validation-v1beta1.k8s.elastic.co',
          matchPolicy: 'Exact',
          admissionReviewVersions: [
            'v1beta1',
          ],
          sideEffects: 'None',
          rules: [
            {
              apiGroups: [
                'elasticsearch.k8s.elastic.co',
              ],
              apiVersions: [
                'v1beta1',
              ],
              operations: [
                'CREATE',
                'UPDATE',
              ],
              resources: [
                'elasticsearches',
              ],
            },
          ],
        },
        {
          clientConfig: {
            caBundle: 'Cg==',
            service: {
              name: 'elastic-webhook-server',
              namespace: j.config.namespace,
              path: '/validate-kibana-k8s-elastic-co-v1-kibana',
            },
          },
          failurePolicy: 'Ignore',
          name: 'elastic-kb-validation-v1.k8s.elastic.co',
          matchPolicy: 'Exact',
          admissionReviewVersions: [
            'v1beta1',
          ],
          sideEffects: 'None',
          rules: [
            {
              apiGroups: [
                'kibana.k8s.elastic.co',
              ],
              apiVersions: [
                'v1',
              ],
              operations: [
                'CREATE',
                'UPDATE',
              ],
              resources: [
                'kibanas',
              ],
            },
          ],
        },
        {
          clientConfig: {
            caBundle: 'Cg==',
            service: {
              name: 'elastic-webhook-server',
              namespace: j.config.namespace,
              path: '/validate-kibana-k8s-elastic-co-v1beta1-kibana',
            },
          },
          failurePolicy: 'Ignore',
          name: 'elastic-kb-validation-v1beta1.k8s.elastic.co',
          matchPolicy: 'Exact',
          admissionReviewVersions: [
            'v1beta1',
          ],
          sideEffects: 'None',
          rules: [
            {
              apiGroups: [
                'kibana.k8s.elastic.co',
              ],
              apiVersions: [
                'v1beta1',
              ],
              operations: [
                'CREATE',
                'UPDATE',
              ],
              resources: [
                'kibanas',
              ],
            },
          ],
        },
      ],
    },


    elasticsearch: {
      apiVersion: 'elasticsearch.k8s.elastic.co/v1',
      kind: 'Elasticsearch',
      metadata: {
        name: 'elastic-' + j.config.name,
        namespace: j.config.namespace,
      },
      spec: {
        version: j.config.elasticsearchVersion,
        nodeSets: [
          {
            name: 'default',
            count: 1,
            config: {
              'node.master': true,
              'node.data': true,
              'node.ingest': true,
              'node.store.allow_mmap': false,
            },
          },
        ],
      },
    },
  },
}
