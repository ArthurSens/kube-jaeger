local defaults = {
  local defaults = self,
  name: 'jaeger-operator',
  namespace: error 'must provide namespace',
  version: error 'must provide version',
  image: error 'must provide image',
  port: 8080,
  resources: {
    limits: { cpu: '500m', memory: '512Mi' },
    requests: { cpu: '100m', memory: '128Mi' },
  },
  commonLabels:: {
    'app.kubernetes.io/name': 'jaeger-operator',
    'app.kubernetes.io/version': defaults.version,
    'app.kubernetes.io/component': 'controller',
  },
  selectorLabels:: {
    [labelName]: defaults.commonLabels[labelName]
    for labelName in std.objectFields(defaults.commonLabels)
    if !std.setMember(labelName, ['app.kubernetes.io/version'])
  },
};

function(params) {
  local jo = self,
  config:: defaults + params,

  // Prefixing with 0 to ensure these manifests are listed and therefore created first.
  '0jaegerCustomResourceDefinition': import '../crds/jaeger-crd.libsonnet',
  '0elasticAgentCustomResourceDefinition': import '../crds/es-agent-crd.libsonnet',
  '0elasticAPMServerCustomResourceDefinition': import '../crds/es-apmServer-crd.libsonnet',
  '0elasticBeatCustomResourceDefinition': import '../crds/es-beat-crd.libsonnet',
  '0elasticElasticMapServerCustomResourceDefinition': import '../crds/es-elasticMapServer-crd.libsonnet',
  '0elasticElasticSearchCustomResourceDefinition': import '../crds/es-elasticsearch-crd.libsonnet',
  '0elasticEnterpriseSearchCustomResourceDefinition': import '../crds/es-enterpriseSearch-crd.libsonnet',
  '0elasticKibanaCustomResourceDefinition': import '../crds/es-kibana-crd.libsonnet',

  clusterRole: {
    apiVersion: 'rbac.authorization.k8s.io/v1',
    kind: 'ClusterRole',
    metadata: {
      name: jo.config.name,
    },
    rules: [
      {
        apiGroups: [
          'jaegertracing.io',
        ],
        resources: [
          '*',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'apps',
        ],
        resourceNames: [
          'jaeger-operator',
        ],
        resources: [
          'deployments/finalizers',
        ],
        verbs: [
          'update',
        ],
      },
      {
        apiGroups: [
          '',
        ],
        resources: [
          'configmaps',
          'persistentvolumeclaims',
          'pods',
          'secrets',
          'serviceaccounts',
          'services',
          'services/finalizers',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'apps',
        ],
        resources: [
          'deployments',
          'daemonsets',
          'replicasets',
          'statefulsets',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'extensions',
        ],
        resources: [
          'ingresses',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'networking.k8s.io',
        ],
        resources: [
          'ingresses',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'batch',
        ],
        resources: [
          'jobs',
          'cronjobs',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'route.openshift.io',
        ],
        resources: [
          'routes',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'console.openshift.io',
        ],
        resources: [
          'consolelinks',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'autoscaling',
        ],
        resources: [
          'horizontalpodautoscalers',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'monitoring.coreos.com',
        ],
        resources: [
          'servicemonitors',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'logging.openshift.io',
        ],
        resources: [
          'elasticsearches',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'kafka.strimzi.io',
        ],
        resources: [
          'kafkas',
          'kafkausers',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          '',
        ],
        resources: [
          'namespaces',
        ],
        verbs: [
          'get',
          'list',
          'watch',
        ],
      },
      {
        apiGroups: [
          'apps',
        ],
        resources: [
          'deployments',
        ],
        verbs: [
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'rbac.authorization.k8s.io',
        ],
        resources: [
          'clusterrolebindings',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
    ],
  },

  clusterRoleBinding: {
    kind: 'ClusterRoleBinding',
    apiVersion: 'rbac.authorization.k8s.io/v1',
    metadata: {
      name: jo.config.name,
    },
    subjects: [
      {
        kind: 'ServiceAccount',
        name: jo.config.name,
        namespace: jo.config.namespace,
      },
    ],
    roleRef: {
      kind: 'ClusterRole',
      name: jo.config.name,
      apiGroup: 'rbac.authorization.k8s.io',
    },
  },

  role: {
    apiVersion: 'rbac.authorization.k8s.io/v1',
    kind: 'Role',
    metadata: {
      name: jo.config.name,
    },
    rules: [
      {
        apiGroups: [
          'jaegertracing.io',
        ],
        resources: [
          '*',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'apps',
        ],
        resourceNames: [
          'jaeger-operator',
        ],
        resources: [
          'deployments/finalizers',
        ],
        verbs: [
          'update',
        ],
      },
      {
        apiGroups: [
          '',
        ],
        resources: [
          'configmaps',
          'persistentvolumeclaims',
          'pods',
          'secrets',
          'serviceaccounts',
          'services',
          'services/finalizers',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'apps',
        ],
        resources: [
          'deployments',
          'daemonsets',
          'replicasets',
          'statefulsets',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'extensions',
        ],
        resources: [
          'ingresses',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'networking.k8s.io',
        ],
        resources: [
          'ingresses',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'batch',
        ],
        resources: [
          'jobs',
          'cronjobs',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'route.openshift.io',
        ],
        resources: [
          'routes',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'image.openshift.io',
        ],
        resources: [
          'imagestreams',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'autoscaling',
        ],
        resources: [
          'horizontalpodautoscalers',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'monitoring.coreos.com',
        ],
        resources: [
          'servicemonitors',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'logging.openshift.io',
        ],
        resources: [
          'elasticsearches',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
      {
        apiGroups: [
          'kafka.strimzi.io',
        ],
        resources: [
          'kafkas',
          'kafkausers',
        ],
        verbs: [
          'create',
          'delete',
          'get',
          'list',
          'patch',
          'update',
          'watch',
        ],
      },
    ],
  },

  roleBinding: {
    kind: 'RoleBinding',
    apiVersion: 'rbac.authorization.k8s.io/v1',
    metadata: {
      name: jo.config.name,
    },
    subjects: [
      {
        kind: 'ServiceAccount',
        name: jo.config.name,
        namespace: jo.config.namespace,
      },
    ],
    roleRef: {
      kind: 'Role',
      name: jo.config.name,
      apiGroup: 'rbac.authorization.k8s.io',
    },
  },

  serviceAccount: {
    apiVersion: 'v1',
    kind: 'ServiceAccount',
    metadata: {
      name: jo.config.name,
      namespace: jo.config.namespace,
    },
  },

  deployment: {
    apiVersion: 'apps/v1',
    kind: 'Deployment',
    metadata: {
      name: jo.config.name,
      namespace: jo.config.namespace,
    },
    spec: {
      replicas: 1,
      selector: {
        matchLabels: jo.config.commonLabels,
      },
      template: {
        metadata: {
          labels: jo.config.commonLabels,
        },
        spec: {
          serviceAccountName: jo.config.name,
          containers: [
            {
              name: jo.config.name,
              image: jo.config.image,
              ports: [
                {
                  containerPort: 8383,
                  name: 'http-metrics',
                },
                {
                  containerPort: 8686,
                  name: 'cr-metrics',
                },
              ],
              args: [
                'start',
              ],
              imagePullPolicy: 'Always',
              resources: jo.config.resources,
              env: [
                {
                  name: 'WATCH_NAMESPACE',
                  valueFrom: {
                    fieldRef: {
                      fieldPath: 'metadata.namespace',
                    },
                  },
                },
                {
                  name: 'POD_NAME',
                  valueFrom: {
                    fieldRef: {
                      fieldPath: 'metadata.name',
                    },
                  },
                },
                {
                  name: 'POD_NAMESPACE',
                  valueFrom: {
                    fieldRef: {
                      fieldPath: 'metadata.namespace',
                    },
                  },
                },
                {
                  name: 'OPERATOR_NAME',
                  value: jo.config.name,
                },
              ],
            },
          ],
        },
      },
    },
  },
}
