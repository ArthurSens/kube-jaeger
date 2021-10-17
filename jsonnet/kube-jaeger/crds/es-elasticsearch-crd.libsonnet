{
  apiVersion: 'apiextensions.k8s.io/v1',
  kind: 'CustomResourceDefinition',
  metadata: {
    annotations: {
      'controller-gen.kubebuilder.io/version': 'v0.6.2',
    },
    creationTimestamp: null,
    labels: {
      'app.kubernetes.io/instance': 'elastic-operator',
      'app.kubernetes.io/name': 'eck-operator-crds',
      'app.kubernetes.io/version': '1.8.0',
    },
    name: 'elasticsearches.elasticsearch.k8s.elastic.co',
  },
  spec: {
    group: 'elasticsearch.k8s.elastic.co',
    names: {
      categories: [
        'elastic',
      ],
      kind: 'Elasticsearch',
      listKind: 'ElasticsearchList',
      plural: 'elasticsearches',
      shortNames: [
        'es',
      ],
      singular: 'elasticsearch',
    },
    scope: 'Namespaced',
    versions: [
      {
        additionalPrinterColumns: [
          {
            jsonPath: '.status.health',
            name: 'health',
            type: 'string',
          },
          {
            description: 'Available nodes',
            jsonPath: '.status.availableNodes',
            name: 'nodes',
            type: 'integer',
          },
          {
            description: 'Elasticsearch version',
            jsonPath: '.status.version',
            name: 'version',
            type: 'string',
          },
          {
            jsonPath: '.status.phase',
            name: 'phase',
            type: 'string',
          },
          {
            jsonPath: '.metadata.creationTimestamp',
            name: 'age',
            type: 'date',
          },
        ],
        name: 'v1',
        schema: {
          openAPIV3Schema: {
            description: 'Elasticsearch represents an Elasticsearch resource in a Kubernetes cluster.',
            properties: {
              apiVersion: {
                description: 'APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources',
                type: 'string',
              },
              kind: {
                description: 'Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds',
                type: 'string',
              },
              metadata: {
                type: 'object',
              },
              spec: {
                description: 'ElasticsearchSpec holds the specification of an Elasticsearch cluster.',
                properties: {
                  auth: {
                    description: 'Auth contains user authentication and authorization security settings for Elasticsearch.',
                    properties: {
                      fileRealm: {
                        description: 'FileRealm to propagate to the Elasticsearch cluster.',
                        items: {
                          description: 'FileRealmSource references users to create in the Elasticsearch cluster.',
                          properties: {
                            secretName: {
                              description: 'SecretName is the name of the secret.',
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        type: 'array',
                      },
                      roles: {
                        description: 'Roles to propagate to the Elasticsearch cluster.',
                        items: {
                          description: 'RoleSource references roles to create in the Elasticsearch cluster.',
                          properties: {
                            secretName: {
                              description: 'SecretName is the name of the secret.',
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        type: 'array',
                      },
                    },
                    type: 'object',
                  },
                  http: {
                    description: 'HTTP holds HTTP layer settings for Elasticsearch.',
                    properties: {
                      service: {
                        description: 'Service defines the template for the associated Kubernetes Service object.',
                        properties: {
                          metadata: {
                            description: 'ObjectMeta is the metadata of the service. The name and namespace provided here are managed by ECK and will be ignored.',
                            properties: {
                              annotations: {
                                additionalProperties: {
                                  type: 'string',
                                },
                                type: 'object',
                              },
                              finalizers: {
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              labels: {
                                additionalProperties: {
                                  type: 'string',
                                },
                                type: 'object',
                              },
                              name: {
                                type: 'string',
                              },
                              namespace: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          spec: {
                            description: 'Spec is the specification of the service.',
                            properties: {
                              allocateLoadBalancerNodePorts: {
                                description: 'allocateLoadBalancerNodePorts defines if NodePorts will be automatically allocated for services with type LoadBalancer.  Default is "true". It may be set to "false" if the cluster load-balancer does not rely on NodePorts. allocateLoadBalancerNodePorts may only be set for services with type LoadBalancer and will be cleared if the type is changed to any other type. This field is alpha-level and is only honored by servers that enable the ServiceLBNodePortControl feature.',
                                type: 'boolean',
                              },
                              clusterIP: {
                                description: 'clusterIP is the IP address of the service and is usually assigned randomly. If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be blank) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are "None", empty string (""), or a valid IP address. Setting this to "None" makes a "headless service" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                type: 'string',
                              },
                              clusterIPs: {
                                description: 'ClusterIPs is a list of IP addresses assigned to this service, and are usually assigned randomly.  If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be empty) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are "None", empty string (""), or a valid IP address.  Setting this to "None" makes a "headless service" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName.  If this field is not specified, it will be initialized from the clusterIP field.  If this field is specified, clients must ensure that clusterIPs[0] and clusterIP have the same value. \n Unless the "IPv6DualStack" feature gate is enabled, this field is limited to one value, which must be the same as the clusterIP field.  If the feature gate is enabled, this field may hold a maximum of two entries (dual-stack IPs, in either order).  These IPs must correspond to the values of the ipFamilies field. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                                'x-kubernetes-list-type': 'atomic',
                              },
                              externalIPs: {
                                description: 'externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.  These IPs are not managed by Kubernetes.  The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system.',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              externalName: {
                                description: 'externalName is the external reference that discovery mechanisms will return as an alias for this service (e.g. a DNS CNAME record). No proxying will be involved.  Must be a lowercase RFC-1123 hostname (https://tools.ietf.org/html/rfc1123) and requires `type` to be "ExternalName".',
                                type: 'string',
                              },
                              externalTrafficPolicy: {
                                description: 'externalTrafficPolicy denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints. "Local" preserves the client source IP and avoids a second hop for LoadBalancer and Nodeport type services, but risks potentially imbalanced traffic spreading. "Cluster" obscures the client source IP and may cause a second hop to another node, but should have good overall load-spreading.',
                                type: 'string',
                              },
                              healthCheckNodePort: {
                                description: 'healthCheckNodePort specifies the healthcheck nodePort for the service. This only applies when type is set to LoadBalancer and externalTrafficPolicy is set to Local. If a value is specified, is in-range, and is not in use, it will be used.  If not specified, a value will be automatically allocated.  External systems (e.g. load-balancers) can use this port to determine if a given node holds endpoints for this service or not.  If this field is specified when creating a Service which does not need it, creation will fail. This field will be wiped when updating a Service to no longer need it (e.g. changing type).',
                                format: 'int32',
                                type: 'integer',
                              },
                              internalTrafficPolicy: {
                                description: 'InternalTrafficPolicy specifies if the cluster internal traffic should be routed to all endpoints or node-local endpoints only. "Cluster" routes internal traffic to a Service to all endpoints. "Local" routes traffic to node-local endpoints only, traffic is dropped if no node-local endpoints are ready. The default value is "Cluster".',
                                type: 'string',
                              },
                              ipFamilies: {
                                description: 'IPFamilies is a list of IP families (e.g. IPv4, IPv6) assigned to this service, and is gated by the "IPv6DualStack" feature gate.  This field is usually assigned automatically based on cluster configuration and the ipFamilyPolicy field. If this field is specified manually, the requested family is available in the cluster, and ipFamilyPolicy allows it, it will be used; otherwise creation of the service will fail.  This field is conditionally mutable: it allows for adding or removing a secondary IP family, but it does not allow changing the primary IP family of the Service.  Valid values are "IPv4" and "IPv6".  This field only applies to Services of types ClusterIP, NodePort, and LoadBalancer, and does apply to "headless" services.  This field will be wiped when updating a Service to type ExternalName. \n This field may hold a maximum of two entries (dual-stack families, in either order).  These families must correspond to the values of the clusterIPs field, if specified. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field.',
                                items: {
                                  description: 'IPFamily represents the IP Family (IPv4 or IPv6). This type is used to express the family of an IP expressed by a type (e.g. service.spec.ipFamilies).',
                                  type: 'string',
                                },
                                type: 'array',
                                'x-kubernetes-list-type': 'atomic',
                              },
                              ipFamilyPolicy: {
                                description: 'IPFamilyPolicy represents the dual-stack-ness requested or required by this Service, and is gated by the "IPv6DualStack" feature gate.  If there is no value provided, then this field will be set to SingleStack. Services can be "SingleStack" (a single IP family), "PreferDualStack" (two IP families on dual-stack configured clusters or a single IP family on single-stack clusters), or "RequireDualStack" (two IP families on dual-stack configured clusters, otherwise fail). The ipFamilies and clusterIPs fields depend on the value of this field.  This field will be wiped when updating a service to type ExternalName.',
                                type: 'string',
                              },
                              loadBalancerClass: {
                                description: "loadBalancerClass is the class of the load balancer implementation this Service belongs to. If specified, the value of this field must be a label-style identifier, with an optional prefix, e.g. \"internal-vip\" or \"example.com/internal-vip\". Unprefixed names are reserved for end-users. This field can only be set when the Service type is 'LoadBalancer'. If not set, the default load balancer implementation is used, today this is typically done through the cloud provider integration, but should apply for any default implementation. If set, it is assumed that a load balancer implementation is watching for Services with a matching class. Any default load balancer implementation (e.g. cloud providers) should ignore Services that set this field. This field can only be set when creating or updating a Service to type 'LoadBalancer'. Once set, it can not be changed. This field will be wiped when a service is updated to a non 'LoadBalancer' type.",
                                type: 'string',
                              },
                              loadBalancerIP: {
                                description: 'Only applies to Service Type: LoadBalancer LoadBalancer will get created with the IP specified in this field. This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature.',
                                type: 'string',
                              },
                              loadBalancerSourceRanges: {
                                description: 'If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature." More info: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              ports: {
                                description: 'The list of ports that are exposed by this service. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                items: {
                                  description: "ServicePort contains information on service's port.",
                                  properties: {
                                    appProtocol: {
                                      description: 'The application protocol for this port. This field follows standard Kubernetes label syntax. Un-prefixed names are reserved for IANA standard service names (as per RFC-6335 and http://www.iana.org/assignments/service-names). Non-standard protocols should use prefixed names such as mycompany.com/my-custom-protocol. This is a beta field that is guarded by the ServiceAppProtocol feature gate and enabled by default.',
                                      type: 'string',
                                    },
                                    name: {
                                      description: "The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names. When considering the endpoints for a Service, this must match the 'name' field in the EndpointPort. Optional if only one ServicePort is defined on this service.",
                                      type: 'string',
                                    },
                                    nodePort: {
                                      description: 'The port on each node on which this service is exposed when type is NodePort or LoadBalancer.  Usually assigned by the system. If a value is specified, in-range, and not in use it will be used, otherwise the operation will fail.  If not specified, a port will be allocated if this Service requires one.  If this field is specified when creating a Service which does not need it, creation will fail. This field will be wiped when updating a Service to no longer need it (e.g. changing type from NodePort to ClusterIP). More info: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport',
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    port: {
                                      description: 'The port that will be exposed by this service.',
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    protocol: {
                                      default: 'TCP',
                                      description: 'The IP protocol for this port. Supports "TCP", "UDP", and "SCTP". Default is TCP.',
                                      type: 'string',
                                    },
                                    targetPort: {
                                      anyOf: [
                                        {
                                          type: 'integer',
                                        },
                                        {
                                          type: 'string',
                                        },
                                      ],
                                      description: "Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME. If this is a string, it will be looked up as a named port in the target Pod's container ports. If this is not specified, the value of the 'port' field is used (an identity map). This field is ignored for services with clusterIP=None, and should be omitted or set equal to the 'port' field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service",
                                      'x-kubernetes-int-or-string': true,
                                    },
                                  },
                                  required: [
                                    'port',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                                'x-kubernetes-list-map-keys': [
                                  'port',
                                  'protocol',
                                ],
                                'x-kubernetes-list-type': 'map',
                              },
                              publishNotReadyAddresses: {
                                description: "publishNotReadyAddresses indicates that any agent which deals with endpoints for this Service should disregard any indications of ready/not-ready. The primary use case for setting this field is for a StatefulSet's Headless Service to propagate SRV DNS records for its Pods for the purpose of peer discovery. The Kubernetes controllers that generate Endpoints and EndpointSlice resources for Services interpret this to mean that all endpoints are considered \"ready\" even if the Pods themselves are not. Agents which consume only Kubernetes generated endpoints through the Endpoints or EndpointSlice resources can safely assume this behavior.",
                                type: 'boolean',
                              },
                              selector: {
                                additionalProperties: {
                                  type: 'string',
                                },
                                description: 'Route service traffic to pods with label keys and values matching this selector. If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/',
                                type: 'object',
                              },
                              sessionAffinity: {
                                description: 'Supports "ClientIP" and "None". Used to maintain session affinity. Enable client IP based session affinity. Must be ClientIP or None. Defaults to None. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                type: 'string',
                              },
                              sessionAffinityConfig: {
                                description: 'sessionAffinityConfig contains the configurations of session affinity.',
                                properties: {
                                  clientIP: {
                                    description: 'clientIP contains the configurations of Client IP based session affinity.',
                                    properties: {
                                      timeoutSeconds: {
                                        description: 'timeoutSeconds specifies the seconds of ClientIP type session sticky time. The value must be >0 && <=86400(for 1 day) if ServiceAffinity == "ClientIP". Default value is 10800(for 3 hours).',
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                    },
                                    type: 'object',
                                  },
                                },
                                type: 'object',
                              },
                              topologyKeys: {
                                description: 'topologyKeys is a preference-order list of topology keys which implementations of services should use to preferentially sort endpoints when accessing this Service, it can not be used at the same time as externalTrafficPolicy=Local. Topology keys must be valid label keys and at most 16 keys may be specified. Endpoints are chosen based on the first topology key with available backends. If this field is specified and all entries have no backends that match the topology of the client, the service has no backends for that client and connections should fail. The special value "*" may be used to mean "any topology". This catch-all value, if used, only makes sense as the last value in the list. If this is not specified or empty, no topology constraints will be applied. This field is alpha-level and is only honored by servers that enable the ServiceTopology feature. This field is deprecated and will be removed in a future version.',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              type: {
                                description: 'type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. "ClusterIP" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object or EndpointSlice objects. If clusterIP is "None", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a virtual IP. "NodePort" builds on ClusterIP and allocates a port on every node which routes to the same endpoints as the clusterIP. "LoadBalancer" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the same endpoints as the clusterIP. "ExternalName" aliases this service to the specified externalName. Several other fields do not apply to ExternalName services. More info: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types',
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      tls: {
                        description: 'TLS defines options for configuring TLS for HTTP.',
                        properties: {
                          certificate: {
                            description: 'Certificate is a reference to a Kubernetes secret that contains the certificate and private key for enabling TLS. The referenced secret should contain the following: \n - `ca.crt`: The certificate authority (optional). - `tls.crt`: The certificate (or a chain). - `tls.key`: The private key to the first certificate in the certificate chain.',
                            properties: {
                              secretName: {
                                description: 'SecretName is the name of the secret.',
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          selfSignedCertificate: {
                            description: 'SelfSignedCertificate allows configuring the self-signed certificate generated by the operator.',
                            properties: {
                              disabled: {
                                description: 'Disabled indicates that the provisioning of the self-signed certifcate should be disabled.',
                                type: 'boolean',
                              },
                              subjectAltNames: {
                                description: 'SubjectAlternativeNames is a list of SANs to include in the generated HTTP TLS certificate.',
                                items: {
                                  description: 'SubjectAlternativeName represents a SAN entry in a x509 certificate.',
                                  properties: {
                                    dns: {
                                      description: 'DNS is the DNS name of the subject.',
                                      type: 'string',
                                    },
                                    ip: {
                                      description: 'IP is the IP address of the subject.',
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                type: 'array',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  image: {
                    description: 'Image is the Elasticsearch Docker image to deploy.',
                    type: 'string',
                  },
                  monitoring: {
                    description: 'Monitoring enables you to collect and ship log and monitoring data of this Elasticsearch cluster. See https://www.elastic.co/guide/en/elasticsearch/reference/current/monitor-elasticsearch-cluster.html. Metricbeat and Filebeat are deployed in the same Pod as sidecars and each one sends data to one or two different Elasticsearch monitoring clusters running in the same Kubernetes cluster.',
                    properties: {
                      logs: {
                        description: 'Logs holds references to Elasticsearch clusters which receive log data from this Elasticsearch cluster.',
                        properties: {
                          elasticsearchRefs: {
                            description: 'ElasticsearchRefs is a reference to a list of monitoring Elasticsearch clusters running in the same Kubernetes cluster. Due to existing limitations, only a single Elasticsearch cluster is currently supported.',
                            items: {
                              description: 'ObjectSelector defines a reference to a Kubernetes object.',
                              properties: {
                                name: {
                                  description: 'Name of the Kubernetes object.',
                                  type: 'string',
                                },
                                namespace: {
                                  description: 'Namespace of the Kubernetes object. If empty, defaults to the current namespace.',
                                  type: 'string',
                                },
                                serviceName: {
                                  description: 'ServiceName is the name of an existing Kubernetes service which is used to make requests to the referenced object. It has to be in the same namespace as the referenced resource. If left empty, the default HTTP service of the referenced resource is used.',
                                  type: 'string',
                                },
                              },
                              required: [
                                'name',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                        },
                        type: 'object',
                      },
                      metrics: {
                        description: 'Metrics holds references to Elasticsearch clusters which receive monitoring data from this Elasticsearch cluster.',
                        properties: {
                          elasticsearchRefs: {
                            description: 'ElasticsearchRefs is a reference to a list of monitoring Elasticsearch clusters running in the same Kubernetes cluster. Due to existing limitations, only a single Elasticsearch cluster is currently supported.',
                            items: {
                              description: 'ObjectSelector defines a reference to a Kubernetes object.',
                              properties: {
                                name: {
                                  description: 'Name of the Kubernetes object.',
                                  type: 'string',
                                },
                                namespace: {
                                  description: 'Namespace of the Kubernetes object. If empty, defaults to the current namespace.',
                                  type: 'string',
                                },
                                serviceName: {
                                  description: 'ServiceName is the name of an existing Kubernetes service which is used to make requests to the referenced object. It has to be in the same namespace as the referenced resource. If left empty, the default HTTP service of the referenced resource is used.',
                                  type: 'string',
                                },
                              },
                              required: [
                                'name',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  nodeSets: {
                    description: 'NodeSets allow specifying groups of Elasticsearch nodes sharing the same configuration and Pod templates.',
                    items: {
                      description: 'NodeSet is the specification for a group of Elasticsearch nodes sharing the same configuration and a Pod template.',
                      properties: {
                        config: {
                          description: 'Config holds the Elasticsearch configuration.',
                          type: 'object',
                          'x-kubernetes-preserve-unknown-fields': true,
                        },
                        count: {
                          description: 'Count of Elasticsearch nodes to deploy. If the node set is managed by an autoscaling policy the initial value is automatically set by the autoscaling controller.',
                          format: 'int32',
                          type: 'integer',
                        },
                        name: {
                          description: 'Name of this set of nodes. Becomes a part of the Elasticsearch node.name setting.',
                          maxLength: 23,
                          pattern: '[a-zA-Z0-9-]+',
                          type: 'string',
                        },
                        podTemplate: {
                          description: 'PodTemplate provides customisation options (labels, annotations, affinity rules, resource requests, and so on) for the Pods belonging to this NodeSet.',
                          type: 'object',
                          'x-kubernetes-preserve-unknown-fields': true,
                        },
                        volumeClaimTemplates: {
                          description: 'VolumeClaimTemplates is a list of persistent volume claims to be used by each Pod in this NodeSet. Every claim in this list must have a matching volumeMount in one of the containers defined in the PodTemplate. Items defined here take precedence over any default claims added by the operator with the same name.',
                          items: {
                            description: "PersistentVolumeClaim is a user's request for and claim to a persistent volume",
                            properties: {
                              apiVersion: {
                                description: 'APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources',
                                type: 'string',
                              },
                              kind: {
                                description: 'Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds',
                                type: 'string',
                              },
                              metadata: {
                                description: "Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata",
                                properties: {
                                  annotations: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    type: 'object',
                                  },
                                  finalizers: {
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  labels: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    type: 'object',
                                  },
                                  name: {
                                    type: 'string',
                                  },
                                  namespace: {
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              spec: {
                                description: 'Spec defines the desired characteristics of a volume requested by a pod author. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims',
                                properties: {
                                  accessModes: {
                                    description: 'AccessModes contains the desired access modes the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  dataSource: {
                                    description: 'This field can be used to specify either: * An existing VolumeSnapshot object (snapshot.storage.k8s.io/VolumeSnapshot) * An existing PVC (PersistentVolumeClaim) * An existing custom resource that implements data population (Alpha) In order to use custom resource types that implement data population, the AnyVolumeDataSource feature gate must be enabled. If the provisioner or an external controller can support the specified data source, it will create a new volume based on the contents of the specified data source.',
                                    properties: {
                                      apiGroup: {
                                        description: 'APIGroup is the group for the resource being referenced. If APIGroup is not specified, the specified Kind must be in the core API group. For any other third-party types, APIGroup is required.',
                                        type: 'string',
                                      },
                                      kind: {
                                        description: 'Kind is the type of resource being referenced',
                                        type: 'string',
                                      },
                                      name: {
                                        description: 'Name is the name of resource being referenced',
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'kind',
                                      'name',
                                    ],
                                    type: 'object',
                                  },
                                  resources: {
                                    description: 'Resources represents the minimum resources the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources',
                                    properties: {
                                      limits: {
                                        additionalProperties: {
                                          anyOf: [
                                            {
                                              type: 'integer',
                                            },
                                            {
                                              type: 'string',
                                            },
                                          ],
                                          pattern: '^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$',
                                          'x-kubernetes-int-or-string': true,
                                        },
                                        description: 'Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/',
                                        type: 'object',
                                      },
                                      requests: {
                                        additionalProperties: {
                                          anyOf: [
                                            {
                                              type: 'integer',
                                            },
                                            {
                                              type: 'string',
                                            },
                                          ],
                                          pattern: '^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$',
                                          'x-kubernetes-int-or-string': true,
                                        },
                                        description: 'Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/',
                                        type: 'object',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  selector: {
                                    description: 'A label query over volumes to consider for binding.',
                                    properties: {
                                      matchExpressions: {
                                        description: 'matchExpressions is a list of label selector requirements. The requirements are ANDed.',
                                        items: {
                                          description: 'A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values.',
                                          properties: {
                                            key: {
                                              description: 'key is the label key that the selector applies to.',
                                              type: 'string',
                                            },
                                            operator: {
                                              description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist.",
                                              type: 'string',
                                            },
                                            values: {
                                              description: 'values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.',
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                          },
                                          required: [
                                            'key',
                                            'operator',
                                          ],
                                          type: 'object',
                                        },
                                        type: 'array',
                                      },
                                      matchLabels: {
                                        additionalProperties: {
                                          type: 'string',
                                        },
                                        description: 'matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.',
                                        type: 'object',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  storageClassName: {
                                    description: 'Name of the StorageClass required by the claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1',
                                    type: 'string',
                                  },
                                  volumeMode: {
                                    description: 'volumeMode defines what type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec.',
                                    type: 'string',
                                  },
                                  volumeName: {
                                    description: 'VolumeName is the binding reference to the PersistentVolume backing this claim.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              status: {
                                description: 'Status represents the current information/status of a persistent volume claim. Read-only. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims',
                                properties: {
                                  accessModes: {
                                    description: 'AccessModes contains the actual access modes the volume backing the PVC has. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  capacity: {
                                    additionalProperties: {
                                      anyOf: [
                                        {
                                          type: 'integer',
                                        },
                                        {
                                          type: 'string',
                                        },
                                      ],
                                      pattern: '^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$',
                                      'x-kubernetes-int-or-string': true,
                                    },
                                    description: 'Represents the actual resources of the underlying volume.',
                                    type: 'object',
                                  },
                                  conditions: {
                                    description: "Current Condition of persistent volume claim. If underlying persistent volume is being resized then the Condition will be set to 'ResizeStarted'.",
                                    items: {
                                      description: 'PersistentVolumeClaimCondition contails details about state of pvc',
                                      properties: {
                                        lastProbeTime: {
                                          description: 'Last time we probed the condition.',
                                          format: 'date-time',
                                          type: 'string',
                                        },
                                        lastTransitionTime: {
                                          description: 'Last time the condition transitioned from one status to another.',
                                          format: 'date-time',
                                          type: 'string',
                                        },
                                        message: {
                                          description: 'Human-readable message indicating details about last transition.',
                                          type: 'string',
                                        },
                                        reason: {
                                          description: "Unique, this should be a short, machine understandable string that gives the reason for condition's last transition. If it reports \"ResizeStarted\" that means the underlying persistent volume is being resized.",
                                          type: 'string',
                                        },
                                        status: {
                                          type: 'string',
                                        },
                                        type: {
                                          description: 'PersistentVolumeClaimConditionType is a valid value of PersistentVolumeClaimCondition.Type',
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'status',
                                        'type',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  phase: {
                                    description: 'Phase represents the current phase of PersistentVolumeClaim.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          type: 'array',
                        },
                      },
                      required: [
                        'name',
                      ],
                      type: 'object',
                    },
                    minItems: 1,
                    type: 'array',
                  },
                  podDisruptionBudget: {
                    description: 'PodDisruptionBudget provides access to the default pod disruption budget for the Elasticsearch cluster. The default budget selects all cluster pods and sets `maxUnavailable` to 1. To disable, set `PodDisruptionBudget` to the empty value (`{}` in YAML).',
                    properties: {
                      metadata: {
                        description: 'ObjectMeta is the metadata of the PDB. The name and namespace provided here are managed by ECK and will be ignored.',
                        properties: {
                          annotations: {
                            additionalProperties: {
                              type: 'string',
                            },
                            type: 'object',
                          },
                          finalizers: {
                            items: {
                              type: 'string',
                            },
                            type: 'array',
                          },
                          labels: {
                            additionalProperties: {
                              type: 'string',
                            },
                            type: 'object',
                          },
                          name: {
                            type: 'string',
                          },
                          namespace: {
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      spec: {
                        description: 'Spec is the specification of the PDB.',
                        properties: {
                          maxUnavailable: {
                            anyOf: [
                              {
                                type: 'integer',
                              },
                              {
                                type: 'string',
                              },
                            ],
                            description: 'An eviction is allowed if at most "maxUnavailable" pods selected by "selector" are unavailable after the eviction, i.e. even in absence of the evicted pod. For example, one can prevent all voluntary evictions by specifying 0. This is a mutually exclusive setting with "minAvailable".',
                            'x-kubernetes-int-or-string': true,
                          },
                          minAvailable: {
                            anyOf: [
                              {
                                type: 'integer',
                              },
                              {
                                type: 'string',
                              },
                            ],
                            description: 'An eviction is allowed if at least "minAvailable" pods selected by "selector" will still be available after the eviction, i.e. even in the absence of the evicted pod.  So for example you can prevent all voluntary evictions by specifying "100%".',
                            'x-kubernetes-int-or-string': true,
                          },
                          selector: {
                            description: 'Label query over pods whose evictions are managed by the disruption budget. A null selector selects no pods. An empty selector ({}) also selects no pods, which differs from standard behavior of selecting all pods. In policy/v1, an empty selector will select all pods in the namespace.',
                            properties: {
                              matchExpressions: {
                                description: 'matchExpressions is a list of label selector requirements. The requirements are ANDed.',
                                items: {
                                  description: 'A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values.',
                                  properties: {
                                    key: {
                                      description: 'key is the label key that the selector applies to.',
                                      type: 'string',
                                    },
                                    operator: {
                                      description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist.",
                                      type: 'string',
                                    },
                                    values: {
                                      description: 'values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.',
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                  },
                                  required: [
                                    'key',
                                    'operator',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              matchLabels: {
                                additionalProperties: {
                                  type: 'string',
                                },
                                description: 'matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.',
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  remoteClusters: {
                    description: 'RemoteClusters enables you to establish uni-directional connections to a remote Elasticsearch cluster.',
                    items: {
                      description: 'RemoteCluster declares a remote Elasticsearch cluster connection.',
                      properties: {
                        elasticsearchRef: {
                          description: 'ElasticsearchRef is a reference to an Elasticsearch cluster running within the same k8s cluster.',
                          properties: {
                            name: {
                              description: 'Name of the Kubernetes object.',
                              type: 'string',
                            },
                            namespace: {
                              description: 'Namespace of the Kubernetes object. If empty, defaults to the current namespace.',
                              type: 'string',
                            },
                            serviceName: {
                              description: 'ServiceName is the name of an existing Kubernetes service which is used to make requests to the referenced object. It has to be in the same namespace as the referenced resource. If left empty, the default HTTP service of the referenced resource is used.',
                              type: 'string',
                            },
                          },
                          required: [
                            'name',
                          ],
                          type: 'object',
                        },
                        name: {
                          description: 'Name is the name of the remote cluster as it is set in the Elasticsearch settings. The name is expected to be unique for each remote clusters.',
                          minLength: 1,
                          type: 'string',
                        },
                      },
                      required: [
                        'name',
                      ],
                      type: 'object',
                    },
                    type: 'array',
                  },
                  secureSettings: {
                    description: 'SecureSettings is a list of references to Kubernetes secrets containing sensitive configuration options for Elasticsearch.',
                    items: {
                      description: 'SecretSource defines a data source based on a Kubernetes Secret.',
                      properties: {
                        entries: {
                          description: 'Entries define how to project each key-value pair in the secret to filesystem paths. If not defined, all keys will be projected to similarly named paths in the filesystem. If defined, only the specified keys will be projected to the corresponding paths.',
                          items: {
                            description: 'KeyToPath defines how to map a key in a Secret object to a filesystem path.',
                            properties: {
                              key: {
                                description: 'Key is the key contained in the secret.',
                                type: 'string',
                              },
                              path: {
                                description: 'Path is the relative file path to map the key to. Path must not be an absolute file path and must not contain any ".." components.',
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                            ],
                            type: 'object',
                          },
                          type: 'array',
                        },
                        secretName: {
                          description: 'SecretName is the name of the secret.',
                          type: 'string',
                        },
                      },
                      required: [
                        'secretName',
                      ],
                      type: 'object',
                    },
                    type: 'array',
                  },
                  serviceAccountName: {
                    description: 'ServiceAccountName is used to check access from the current resource to a resource (eg. a remote Elasticsearch cluster) in a different namespace. Can only be used if ECK is enforcing RBAC on references.',
                    type: 'string',
                  },
                  transport: {
                    description: 'Transport holds transport layer settings for Elasticsearch.',
                    properties: {
                      service: {
                        description: 'Service defines the template for the associated Kubernetes Service object.',
                        properties: {
                          metadata: {
                            description: 'ObjectMeta is the metadata of the service. The name and namespace provided here are managed by ECK and will be ignored.',
                            properties: {
                              annotations: {
                                additionalProperties: {
                                  type: 'string',
                                },
                                type: 'object',
                              },
                              finalizers: {
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              labels: {
                                additionalProperties: {
                                  type: 'string',
                                },
                                type: 'object',
                              },
                              name: {
                                type: 'string',
                              },
                              namespace: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          spec: {
                            description: 'Spec is the specification of the service.',
                            properties: {
                              allocateLoadBalancerNodePorts: {
                                description: 'allocateLoadBalancerNodePorts defines if NodePorts will be automatically allocated for services with type LoadBalancer.  Default is "true". It may be set to "false" if the cluster load-balancer does not rely on NodePorts. allocateLoadBalancerNodePorts may only be set for services with type LoadBalancer and will be cleared if the type is changed to any other type. This field is alpha-level and is only honored by servers that enable the ServiceLBNodePortControl feature.',
                                type: 'boolean',
                              },
                              clusterIP: {
                                description: 'clusterIP is the IP address of the service and is usually assigned randomly. If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be blank) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are "None", empty string (""), or a valid IP address. Setting this to "None" makes a "headless service" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                type: 'string',
                              },
                              clusterIPs: {
                                description: 'ClusterIPs is a list of IP addresses assigned to this service, and are usually assigned randomly.  If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be empty) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are "None", empty string (""), or a valid IP address.  Setting this to "None" makes a "headless service" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName.  If this field is not specified, it will be initialized from the clusterIP field.  If this field is specified, clients must ensure that clusterIPs[0] and clusterIP have the same value. \n Unless the "IPv6DualStack" feature gate is enabled, this field is limited to one value, which must be the same as the clusterIP field.  If the feature gate is enabled, this field may hold a maximum of two entries (dual-stack IPs, in either order).  These IPs must correspond to the values of the ipFamilies field. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                                'x-kubernetes-list-type': 'atomic',
                              },
                              externalIPs: {
                                description: 'externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.  These IPs are not managed by Kubernetes.  The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system.',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              externalName: {
                                description: 'externalName is the external reference that discovery mechanisms will return as an alias for this service (e.g. a DNS CNAME record). No proxying will be involved.  Must be a lowercase RFC-1123 hostname (https://tools.ietf.org/html/rfc1123) and requires `type` to be "ExternalName".',
                                type: 'string',
                              },
                              externalTrafficPolicy: {
                                description: 'externalTrafficPolicy denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints. "Local" preserves the client source IP and avoids a second hop for LoadBalancer and Nodeport type services, but risks potentially imbalanced traffic spreading. "Cluster" obscures the client source IP and may cause a second hop to another node, but should have good overall load-spreading.',
                                type: 'string',
                              },
                              healthCheckNodePort: {
                                description: 'healthCheckNodePort specifies the healthcheck nodePort for the service. This only applies when type is set to LoadBalancer and externalTrafficPolicy is set to Local. If a value is specified, is in-range, and is not in use, it will be used.  If not specified, a value will be automatically allocated.  External systems (e.g. load-balancers) can use this port to determine if a given node holds endpoints for this service or not.  If this field is specified when creating a Service which does not need it, creation will fail. This field will be wiped when updating a Service to no longer need it (e.g. changing type).',
                                format: 'int32',
                                type: 'integer',
                              },
                              internalTrafficPolicy: {
                                description: 'InternalTrafficPolicy specifies if the cluster internal traffic should be routed to all endpoints or node-local endpoints only. "Cluster" routes internal traffic to a Service to all endpoints. "Local" routes traffic to node-local endpoints only, traffic is dropped if no node-local endpoints are ready. The default value is "Cluster".',
                                type: 'string',
                              },
                              ipFamilies: {
                                description: 'IPFamilies is a list of IP families (e.g. IPv4, IPv6) assigned to this service, and is gated by the "IPv6DualStack" feature gate.  This field is usually assigned automatically based on cluster configuration and the ipFamilyPolicy field. If this field is specified manually, the requested family is available in the cluster, and ipFamilyPolicy allows it, it will be used; otherwise creation of the service will fail.  This field is conditionally mutable: it allows for adding or removing a secondary IP family, but it does not allow changing the primary IP family of the Service.  Valid values are "IPv4" and "IPv6".  This field only applies to Services of types ClusterIP, NodePort, and LoadBalancer, and does apply to "headless" services.  This field will be wiped when updating a Service to type ExternalName. \n This field may hold a maximum of two entries (dual-stack families, in either order).  These families must correspond to the values of the clusterIPs field, if specified. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field.',
                                items: {
                                  description: 'IPFamily represents the IP Family (IPv4 or IPv6). This type is used to express the family of an IP expressed by a type (e.g. service.spec.ipFamilies).',
                                  type: 'string',
                                },
                                type: 'array',
                                'x-kubernetes-list-type': 'atomic',
                              },
                              ipFamilyPolicy: {
                                description: 'IPFamilyPolicy represents the dual-stack-ness requested or required by this Service, and is gated by the "IPv6DualStack" feature gate.  If there is no value provided, then this field will be set to SingleStack. Services can be "SingleStack" (a single IP family), "PreferDualStack" (two IP families on dual-stack configured clusters or a single IP family on single-stack clusters), or "RequireDualStack" (two IP families on dual-stack configured clusters, otherwise fail). The ipFamilies and clusterIPs fields depend on the value of this field.  This field will be wiped when updating a service to type ExternalName.',
                                type: 'string',
                              },
                              loadBalancerClass: {
                                description: "loadBalancerClass is the class of the load balancer implementation this Service belongs to. If specified, the value of this field must be a label-style identifier, with an optional prefix, e.g. \"internal-vip\" or \"example.com/internal-vip\". Unprefixed names are reserved for end-users. This field can only be set when the Service type is 'LoadBalancer'. If not set, the default load balancer implementation is used, today this is typically done through the cloud provider integration, but should apply for any default implementation. If set, it is assumed that a load balancer implementation is watching for Services with a matching class. Any default load balancer implementation (e.g. cloud providers) should ignore Services that set this field. This field can only be set when creating or updating a Service to type 'LoadBalancer'. Once set, it can not be changed. This field will be wiped when a service is updated to a non 'LoadBalancer' type.",
                                type: 'string',
                              },
                              loadBalancerIP: {
                                description: 'Only applies to Service Type: LoadBalancer LoadBalancer will get created with the IP specified in this field. This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature.',
                                type: 'string',
                              },
                              loadBalancerSourceRanges: {
                                description: 'If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature." More info: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              ports: {
                                description: 'The list of ports that are exposed by this service. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                items: {
                                  description: "ServicePort contains information on service's port.",
                                  properties: {
                                    appProtocol: {
                                      description: 'The application protocol for this port. This field follows standard Kubernetes label syntax. Un-prefixed names are reserved for IANA standard service names (as per RFC-6335 and http://www.iana.org/assignments/service-names). Non-standard protocols should use prefixed names such as mycompany.com/my-custom-protocol. This is a beta field that is guarded by the ServiceAppProtocol feature gate and enabled by default.',
                                      type: 'string',
                                    },
                                    name: {
                                      description: "The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names. When considering the endpoints for a Service, this must match the 'name' field in the EndpointPort. Optional if only one ServicePort is defined on this service.",
                                      type: 'string',
                                    },
                                    nodePort: {
                                      description: 'The port on each node on which this service is exposed when type is NodePort or LoadBalancer.  Usually assigned by the system. If a value is specified, in-range, and not in use it will be used, otherwise the operation will fail.  If not specified, a port will be allocated if this Service requires one.  If this field is specified when creating a Service which does not need it, creation will fail. This field will be wiped when updating a Service to no longer need it (e.g. changing type from NodePort to ClusterIP). More info: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport',
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    port: {
                                      description: 'The port that will be exposed by this service.',
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    protocol: {
                                      default: 'TCP',
                                      description: 'The IP protocol for this port. Supports "TCP", "UDP", and "SCTP". Default is TCP.',
                                      type: 'string',
                                    },
                                    targetPort: {
                                      anyOf: [
                                        {
                                          type: 'integer',
                                        },
                                        {
                                          type: 'string',
                                        },
                                      ],
                                      description: "Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME. If this is a string, it will be looked up as a named port in the target Pod's container ports. If this is not specified, the value of the 'port' field is used (an identity map). This field is ignored for services with clusterIP=None, and should be omitted or set equal to the 'port' field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service",
                                      'x-kubernetes-int-or-string': true,
                                    },
                                  },
                                  required: [
                                    'port',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                                'x-kubernetes-list-map-keys': [
                                  'port',
                                  'protocol',
                                ],
                                'x-kubernetes-list-type': 'map',
                              },
                              publishNotReadyAddresses: {
                                description: "publishNotReadyAddresses indicates that any agent which deals with endpoints for this Service should disregard any indications of ready/not-ready. The primary use case for setting this field is for a StatefulSet's Headless Service to propagate SRV DNS records for its Pods for the purpose of peer discovery. The Kubernetes controllers that generate Endpoints and EndpointSlice resources for Services interpret this to mean that all endpoints are considered \"ready\" even if the Pods themselves are not. Agents which consume only Kubernetes generated endpoints through the Endpoints or EndpointSlice resources can safely assume this behavior.",
                                type: 'boolean',
                              },
                              selector: {
                                additionalProperties: {
                                  type: 'string',
                                },
                                description: 'Route service traffic to pods with label keys and values matching this selector. If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/',
                                type: 'object',
                              },
                              sessionAffinity: {
                                description: 'Supports "ClientIP" and "None". Used to maintain session affinity. Enable client IP based session affinity. Must be ClientIP or None. Defaults to None. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                type: 'string',
                              },
                              sessionAffinityConfig: {
                                description: 'sessionAffinityConfig contains the configurations of session affinity.',
                                properties: {
                                  clientIP: {
                                    description: 'clientIP contains the configurations of Client IP based session affinity.',
                                    properties: {
                                      timeoutSeconds: {
                                        description: 'timeoutSeconds specifies the seconds of ClientIP type session sticky time. The value must be >0 && <=86400(for 1 day) if ServiceAffinity == "ClientIP". Default value is 10800(for 3 hours).',
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                    },
                                    type: 'object',
                                  },
                                },
                                type: 'object',
                              },
                              topologyKeys: {
                                description: 'topologyKeys is a preference-order list of topology keys which implementations of services should use to preferentially sort endpoints when accessing this Service, it can not be used at the same time as externalTrafficPolicy=Local. Topology keys must be valid label keys and at most 16 keys may be specified. Endpoints are chosen based on the first topology key with available backends. If this field is specified and all entries have no backends that match the topology of the client, the service has no backends for that client and connections should fail. The special value "*" may be used to mean "any topology". This catch-all value, if used, only makes sense as the last value in the list. If this is not specified or empty, no topology constraints will be applied. This field is alpha-level and is only honored by servers that enable the ServiceTopology feature. This field is deprecated and will be removed in a future version.',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              type: {
                                description: 'type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. "ClusterIP" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object or EndpointSlice objects. If clusterIP is "None", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a virtual IP. "NodePort" builds on ClusterIP and allocates a port on every node which routes to the same endpoints as the clusterIP. "LoadBalancer" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the same endpoints as the clusterIP. "ExternalName" aliases this service to the specified externalName. Several other fields do not apply to ExternalName services. More info: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types',
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      tls: {
                        description: 'TLS defines options for configuring TLS on the transport layer.',
                        properties: {
                          certificate: {
                            description: 'Certificate is a reference to a Kubernetes secret that contains the CA certificate and private key for generating node certificates. The referenced secret should contain the following: \n - `ca.crt`: The CA certificate in PEM format. - `ca.key`: The private key for the CA certificate in PEM format.',
                            properties: {
                              secretName: {
                                description: 'SecretName is the name of the secret.',
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          subjectAltNames: {
                            description: 'SubjectAlternativeNames is a list of SANs to include in the generated node transport TLS certificates.',
                            items: {
                              description: 'SubjectAlternativeName represents a SAN entry in a x509 certificate.',
                              properties: {
                                dns: {
                                  description: 'DNS is the DNS name of the subject.',
                                  type: 'string',
                                },
                                ip: {
                                  description: 'IP is the IP address of the subject.',
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            type: 'array',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  updateStrategy: {
                    description: 'UpdateStrategy specifies how updates to the cluster should be performed.',
                    properties: {
                      changeBudget: {
                        description: 'ChangeBudget defines the constraints to consider when applying changes to the Elasticsearch cluster.',
                        properties: {
                          maxSurge: {
                            description: 'MaxSurge is the maximum number of new pods that can be created exceeding the original number of pods defined in the specification. MaxSurge is only taken into consideration when scaling up. Setting a negative value will disable the restriction. Defaults to unbounded if not specified.',
                            format: 'int32',
                            type: 'integer',
                          },
                          maxUnavailable: {
                            description: 'MaxUnavailable is the maximum number of pods that can be unavailable (not ready) during the update due to circumstances under the control of the operator. Setting a negative value will disable this restriction. Defaults to 1 if not specified.',
                            format: 'int32',
                            type: 'integer',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  version: {
                    description: 'Version of Elasticsearch.',
                    type: 'string',
                  },
                  volumeClaimDeletePolicy: {
                    description: 'VolumeClaimDeletePolicy sets the policy for handling deletion of PersistentVolumeClaims for all NodeSets. Possible values are DeleteOnScaledownOnly and DeleteOnScaledownAndClusterDeletion. Defaults to DeleteOnScaledownAndClusterDeletion.',
                    enum: [
                      'DeleteOnScaledownOnly',
                      'DeleteOnScaledownAndClusterDeletion',
                    ],
                    type: 'string',
                  },
                },
                required: [
                  'nodeSets',
                  'version',
                ],
                type: 'object',
              },
              status: {
                description: 'ElasticsearchStatus defines the observed state of Elasticsearch',
                properties: {
                  availableNodes: {
                    description: 'AvailableNodes is the number of available instances.',
                    format: 'int32',
                    type: 'integer',
                  },
                  health: {
                    description: 'ElasticsearchHealth is the health of the cluster as returned by the health API.',
                    type: 'string',
                  },
                  monitoringAssociationStatus: {
                    additionalProperties: {
                      description: 'AssociationStatus is the status of an association resource.',
                      type: 'string',
                    },
                    description: "AssociationStatusMap is the map of association's namespaced name string to its AssociationStatus. For resources that have a single Association of a given type (for ex. single ES reference), this map contains a single entry.",
                    type: 'object',
                  },
                  phase: {
                    description: 'ElasticsearchOrchestrationPhase is the phase Elasticsearch is in from the controller point of view.',
                    type: 'string',
                  },
                  version: {
                    description: 'Version of the stack resource currently running. During version upgrades, multiple versions may run in parallel: this value specifies the lowest version currently running.',
                    type: 'string',
                  },
                },
                type: 'object',
              },
            },
            type: 'object',
          },
        },
        served: true,
        storage: true,
        subresources: {
          status: {},
        },
      },
      {
        additionalPrinterColumns: [
          {
            jsonPath: '.status.health',
            name: 'health',
            type: 'string',
          },
          {
            description: 'Available nodes',
            jsonPath: '.status.availableNodes',
            name: 'nodes',
            type: 'integer',
          },
          {
            description: 'Elasticsearch version',
            jsonPath: '.spec.version',
            name: 'version',
            type: 'string',
          },
          {
            jsonPath: '.status.phase',
            name: 'phase',
            type: 'string',
          },
          {
            jsonPath: '.metadata.creationTimestamp',
            name: 'age',
            type: 'date',
          },
        ],
        name: 'v1beta1',
        schema: {
          openAPIV3Schema: {
            description: 'Elasticsearch represents an Elasticsearch resource in a Kubernetes cluster.',
            properties: {
              apiVersion: {
                description: 'APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources',
                type: 'string',
              },
              kind: {
                description: 'Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds',
                type: 'string',
              },
              metadata: {
                type: 'object',
              },
              spec: {
                description: 'ElasticsearchSpec holds the specification of an Elasticsearch cluster.',
                properties: {
                  http: {
                    description: 'HTTP holds HTTP layer settings for Elasticsearch.',
                    properties: {
                      service: {
                        description: 'Service defines the template for the associated Kubernetes Service object.',
                        properties: {
                          metadata: {
                            description: 'ObjectMeta is the metadata of the service. The name and namespace provided here are managed by ECK and will be ignored.',
                            properties: {
                              annotations: {
                                additionalProperties: {
                                  type: 'string',
                                },
                                type: 'object',
                              },
                              finalizers: {
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              labels: {
                                additionalProperties: {
                                  type: 'string',
                                },
                                type: 'object',
                              },
                              name: {
                                type: 'string',
                              },
                              namespace: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          spec: {
                            description: 'Spec is the specification of the service.',
                            properties: {
                              allocateLoadBalancerNodePorts: {
                                description: 'allocateLoadBalancerNodePorts defines if NodePorts will be automatically allocated for services with type LoadBalancer.  Default is "true". It may be set to "false" if the cluster load-balancer does not rely on NodePorts. allocateLoadBalancerNodePorts may only be set for services with type LoadBalancer and will be cleared if the type is changed to any other type. This field is alpha-level and is only honored by servers that enable the ServiceLBNodePortControl feature.',
                                type: 'boolean',
                              },
                              clusterIP: {
                                description: 'clusterIP is the IP address of the service and is usually assigned randomly. If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be blank) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are "None", empty string (""), or a valid IP address. Setting this to "None" makes a "headless service" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                type: 'string',
                              },
                              clusterIPs: {
                                description: 'ClusterIPs is a list of IP addresses assigned to this service, and are usually assigned randomly.  If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be empty) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are "None", empty string (""), or a valid IP address.  Setting this to "None" makes a "headless service" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName.  If this field is not specified, it will be initialized from the clusterIP field.  If this field is specified, clients must ensure that clusterIPs[0] and clusterIP have the same value. \n Unless the "IPv6DualStack" feature gate is enabled, this field is limited to one value, which must be the same as the clusterIP field.  If the feature gate is enabled, this field may hold a maximum of two entries (dual-stack IPs, in either order).  These IPs must correspond to the values of the ipFamilies field. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                                'x-kubernetes-list-type': 'atomic',
                              },
                              externalIPs: {
                                description: 'externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.  These IPs are not managed by Kubernetes.  The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system.',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              externalName: {
                                description: 'externalName is the external reference that discovery mechanisms will return as an alias for this service (e.g. a DNS CNAME record). No proxying will be involved.  Must be a lowercase RFC-1123 hostname (https://tools.ietf.org/html/rfc1123) and requires `type` to be "ExternalName".',
                                type: 'string',
                              },
                              externalTrafficPolicy: {
                                description: 'externalTrafficPolicy denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints. "Local" preserves the client source IP and avoids a second hop for LoadBalancer and Nodeport type services, but risks potentially imbalanced traffic spreading. "Cluster" obscures the client source IP and may cause a second hop to another node, but should have good overall load-spreading.',
                                type: 'string',
                              },
                              healthCheckNodePort: {
                                description: 'healthCheckNodePort specifies the healthcheck nodePort for the service. This only applies when type is set to LoadBalancer and externalTrafficPolicy is set to Local. If a value is specified, is in-range, and is not in use, it will be used.  If not specified, a value will be automatically allocated.  External systems (e.g. load-balancers) can use this port to determine if a given node holds endpoints for this service or not.  If this field is specified when creating a Service which does not need it, creation will fail. This field will be wiped when updating a Service to no longer need it (e.g. changing type).',
                                format: 'int32',
                                type: 'integer',
                              },
                              internalTrafficPolicy: {
                                description: 'InternalTrafficPolicy specifies if the cluster internal traffic should be routed to all endpoints or node-local endpoints only. "Cluster" routes internal traffic to a Service to all endpoints. "Local" routes traffic to node-local endpoints only, traffic is dropped if no node-local endpoints are ready. The default value is "Cluster".',
                                type: 'string',
                              },
                              ipFamilies: {
                                description: 'IPFamilies is a list of IP families (e.g. IPv4, IPv6) assigned to this service, and is gated by the "IPv6DualStack" feature gate.  This field is usually assigned automatically based on cluster configuration and the ipFamilyPolicy field. If this field is specified manually, the requested family is available in the cluster, and ipFamilyPolicy allows it, it will be used; otherwise creation of the service will fail.  This field is conditionally mutable: it allows for adding or removing a secondary IP family, but it does not allow changing the primary IP family of the Service.  Valid values are "IPv4" and "IPv6".  This field only applies to Services of types ClusterIP, NodePort, and LoadBalancer, and does apply to "headless" services.  This field will be wiped when updating a Service to type ExternalName. \n This field may hold a maximum of two entries (dual-stack families, in either order).  These families must correspond to the values of the clusterIPs field, if specified. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field.',
                                items: {
                                  description: 'IPFamily represents the IP Family (IPv4 or IPv6). This type is used to express the family of an IP expressed by a type (e.g. service.spec.ipFamilies).',
                                  type: 'string',
                                },
                                type: 'array',
                                'x-kubernetes-list-type': 'atomic',
                              },
                              ipFamilyPolicy: {
                                description: 'IPFamilyPolicy represents the dual-stack-ness requested or required by this Service, and is gated by the "IPv6DualStack" feature gate.  If there is no value provided, then this field will be set to SingleStack. Services can be "SingleStack" (a single IP family), "PreferDualStack" (two IP families on dual-stack configured clusters or a single IP family on single-stack clusters), or "RequireDualStack" (two IP families on dual-stack configured clusters, otherwise fail). The ipFamilies and clusterIPs fields depend on the value of this field.  This field will be wiped when updating a service to type ExternalName.',
                                type: 'string',
                              },
                              loadBalancerClass: {
                                description: "loadBalancerClass is the class of the load balancer implementation this Service belongs to. If specified, the value of this field must be a label-style identifier, with an optional prefix, e.g. \"internal-vip\" or \"example.com/internal-vip\". Unprefixed names are reserved for end-users. This field can only be set when the Service type is 'LoadBalancer'. If not set, the default load balancer implementation is used, today this is typically done through the cloud provider integration, but should apply for any default implementation. If set, it is assumed that a load balancer implementation is watching for Services with a matching class. Any default load balancer implementation (e.g. cloud providers) should ignore Services that set this field. This field can only be set when creating or updating a Service to type 'LoadBalancer'. Once set, it can not be changed. This field will be wiped when a service is updated to a non 'LoadBalancer' type.",
                                type: 'string',
                              },
                              loadBalancerIP: {
                                description: 'Only applies to Service Type: LoadBalancer LoadBalancer will get created with the IP specified in this field. This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature.',
                                type: 'string',
                              },
                              loadBalancerSourceRanges: {
                                description: 'If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature." More info: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              ports: {
                                description: 'The list of ports that are exposed by this service. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                items: {
                                  description: "ServicePort contains information on service's port.",
                                  properties: {
                                    appProtocol: {
                                      description: 'The application protocol for this port. This field follows standard Kubernetes label syntax. Un-prefixed names are reserved for IANA standard service names (as per RFC-6335 and http://www.iana.org/assignments/service-names). Non-standard protocols should use prefixed names such as mycompany.com/my-custom-protocol. This is a beta field that is guarded by the ServiceAppProtocol feature gate and enabled by default.',
                                      type: 'string',
                                    },
                                    name: {
                                      description: "The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names. When considering the endpoints for a Service, this must match the 'name' field in the EndpointPort. Optional if only one ServicePort is defined on this service.",
                                      type: 'string',
                                    },
                                    nodePort: {
                                      description: 'The port on each node on which this service is exposed when type is NodePort or LoadBalancer.  Usually assigned by the system. If a value is specified, in-range, and not in use it will be used, otherwise the operation will fail.  If not specified, a port will be allocated if this Service requires one.  If this field is specified when creating a Service which does not need it, creation will fail. This field will be wiped when updating a Service to no longer need it (e.g. changing type from NodePort to ClusterIP). More info: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport',
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    port: {
                                      description: 'The port that will be exposed by this service.',
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    protocol: {
                                      default: 'TCP',
                                      description: 'The IP protocol for this port. Supports "TCP", "UDP", and "SCTP". Default is TCP.',
                                      type: 'string',
                                    },
                                    targetPort: {
                                      anyOf: [
                                        {
                                          type: 'integer',
                                        },
                                        {
                                          type: 'string',
                                        },
                                      ],
                                      description: "Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME. If this is a string, it will be looked up as a named port in the target Pod's container ports. If this is not specified, the value of the 'port' field is used (an identity map). This field is ignored for services with clusterIP=None, and should be omitted or set equal to the 'port' field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service",
                                      'x-kubernetes-int-or-string': true,
                                    },
                                  },
                                  required: [
                                    'port',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                                'x-kubernetes-list-map-keys': [
                                  'port',
                                  'protocol',
                                ],
                                'x-kubernetes-list-type': 'map',
                              },
                              publishNotReadyAddresses: {
                                description: "publishNotReadyAddresses indicates that any agent which deals with endpoints for this Service should disregard any indications of ready/not-ready. The primary use case for setting this field is for a StatefulSet's Headless Service to propagate SRV DNS records for its Pods for the purpose of peer discovery. The Kubernetes controllers that generate Endpoints and EndpointSlice resources for Services interpret this to mean that all endpoints are considered \"ready\" even if the Pods themselves are not. Agents which consume only Kubernetes generated endpoints through the Endpoints or EndpointSlice resources can safely assume this behavior.",
                                type: 'boolean',
                              },
                              selector: {
                                additionalProperties: {
                                  type: 'string',
                                },
                                description: 'Route service traffic to pods with label keys and values matching this selector. If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/',
                                type: 'object',
                              },
                              sessionAffinity: {
                                description: 'Supports "ClientIP" and "None". Used to maintain session affinity. Enable client IP based session affinity. Must be ClientIP or None. Defaults to None. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                                type: 'string',
                              },
                              sessionAffinityConfig: {
                                description: 'sessionAffinityConfig contains the configurations of session affinity.',
                                properties: {
                                  clientIP: {
                                    description: 'clientIP contains the configurations of Client IP based session affinity.',
                                    properties: {
                                      timeoutSeconds: {
                                        description: 'timeoutSeconds specifies the seconds of ClientIP type session sticky time. The value must be >0 && <=86400(for 1 day) if ServiceAffinity == "ClientIP". Default value is 10800(for 3 hours).',
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                    },
                                    type: 'object',
                                  },
                                },
                                type: 'object',
                              },
                              topologyKeys: {
                                description: 'topologyKeys is a preference-order list of topology keys which implementations of services should use to preferentially sort endpoints when accessing this Service, it can not be used at the same time as externalTrafficPolicy=Local. Topology keys must be valid label keys and at most 16 keys may be specified. Endpoints are chosen based on the first topology key with available backends. If this field is specified and all entries have no backends that match the topology of the client, the service has no backends for that client and connections should fail. The special value "*" may be used to mean "any topology". This catch-all value, if used, only makes sense as the last value in the list. If this is not specified or empty, no topology constraints will be applied. This field is alpha-level and is only honored by servers that enable the ServiceTopology feature. This field is deprecated and will be removed in a future version.',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              type: {
                                description: 'type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. "ClusterIP" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object or EndpointSlice objects. If clusterIP is "None", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a virtual IP. "NodePort" builds on ClusterIP and allocates a port on every node which routes to the same endpoints as the clusterIP. "LoadBalancer" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the same endpoints as the clusterIP. "ExternalName" aliases this service to the specified externalName. Several other fields do not apply to ExternalName services. More info: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types',
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      tls: {
                        description: 'TLS defines options for configuring TLS for HTTP.',
                        properties: {
                          certificate: {
                            description: 'Certificate is a reference to a Kubernetes secret that contains the certificate and private key for enabling TLS. The referenced secret should contain the following: \n - `ca.crt`: The certificate authority (optional). - `tls.crt`: The certificate (or a chain). - `tls.key`: The private key to the first certificate in the certificate chain.',
                            properties: {
                              secretName: {
                                description: 'SecretName is the name of the secret.',
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          selfSignedCertificate: {
                            description: 'SelfSignedCertificate allows configuring the self-signed certificate generated by the operator.',
                            properties: {
                              disabled: {
                                description: 'Disabled indicates that the provisioning of the self-signed certifcate should be disabled.',
                                type: 'boolean',
                              },
                              subjectAltNames: {
                                description: 'SubjectAlternativeNames is a list of SANs to include in the generated HTTP TLS certificate.',
                                items: {
                                  description: 'SubjectAlternativeName represents a SAN entry in a x509 certificate.',
                                  properties: {
                                    dns: {
                                      description: 'DNS is the DNS name of the subject.',
                                      type: 'string',
                                    },
                                    ip: {
                                      description: 'IP is the IP address of the subject.',
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                type: 'array',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  image: {
                    description: 'Image is the Elasticsearch Docker image to deploy.',
                    type: 'string',
                  },
                  nodeSets: {
                    description: 'NodeSets allow specifying groups of Elasticsearch nodes sharing the same configuration and Pod templates.',
                    items: {
                      description: 'NodeSet is the specification for a group of Elasticsearch nodes sharing the same configuration and a Pod template.',
                      properties: {
                        config: {
                          description: 'Config holds the Elasticsearch configuration.',
                          type: 'object',
                        },
                        count: {
                          description: 'Count of Elasticsearch nodes to deploy.',
                          format: 'int32',
                          minimum: 1,
                          type: 'integer',
                        },
                        name: {
                          description: 'Name of this set of nodes. Becomes a part of the Elasticsearch node.name setting.',
                          maxLength: 23,
                          pattern: '[a-zA-Z0-9-]+',
                          type: 'string',
                        },
                        podTemplate: {
                          description: 'PodTemplate provides customisation options (labels, annotations, affinity rules, resource requests, and so on) for the Pods belonging to this NodeSet.',
                          type: 'object',
                        },
                        volumeClaimTemplates: {
                          description: 'VolumeClaimTemplates is a list of persistent volume claims to be used by each Pod in this NodeSet. Every claim in this list must have a matching volumeMount in one of the containers defined in the PodTemplate. Items defined here take precedence over any default claims added by the operator with the same name.',
                          items: {
                            description: "PersistentVolumeClaim is a user's request for and claim to a persistent volume",
                            properties: {
                              apiVersion: {
                                description: 'APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources',
                                type: 'string',
                              },
                              kind: {
                                description: 'Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds',
                                type: 'string',
                              },
                              metadata: {
                                description: "Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata",
                                properties: {
                                  annotations: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    type: 'object',
                                  },
                                  finalizers: {
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  labels: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    type: 'object',
                                  },
                                  name: {
                                    type: 'string',
                                  },
                                  namespace: {
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              spec: {
                                description: 'Spec defines the desired characteristics of a volume requested by a pod author. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims',
                                properties: {
                                  accessModes: {
                                    description: 'AccessModes contains the desired access modes the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  dataSource: {
                                    description: 'This field can be used to specify either: * An existing VolumeSnapshot object (snapshot.storage.k8s.io/VolumeSnapshot) * An existing PVC (PersistentVolumeClaim) * An existing custom resource that implements data population (Alpha) In order to use custom resource types that implement data population, the AnyVolumeDataSource feature gate must be enabled. If the provisioner or an external controller can support the specified data source, it will create a new volume based on the contents of the specified data source.',
                                    properties: {
                                      apiGroup: {
                                        description: 'APIGroup is the group for the resource being referenced. If APIGroup is not specified, the specified Kind must be in the core API group. For any other third-party types, APIGroup is required.',
                                        type: 'string',
                                      },
                                      kind: {
                                        description: 'Kind is the type of resource being referenced',
                                        type: 'string',
                                      },
                                      name: {
                                        description: 'Name is the name of resource being referenced',
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'kind',
                                      'name',
                                    ],
                                    type: 'object',
                                  },
                                  resources: {
                                    description: 'Resources represents the minimum resources the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources',
                                    properties: {
                                      limits: {
                                        additionalProperties: {
                                          anyOf: [
                                            {
                                              type: 'integer',
                                            },
                                            {
                                              type: 'string',
                                            },
                                          ],
                                          pattern: '^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$',
                                          'x-kubernetes-int-or-string': true,
                                        },
                                        description: 'Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/',
                                        type: 'object',
                                      },
                                      requests: {
                                        additionalProperties: {
                                          anyOf: [
                                            {
                                              type: 'integer',
                                            },
                                            {
                                              type: 'string',
                                            },
                                          ],
                                          pattern: '^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$',
                                          'x-kubernetes-int-or-string': true,
                                        },
                                        description: 'Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/',
                                        type: 'object',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  selector: {
                                    description: 'A label query over volumes to consider for binding.',
                                    properties: {
                                      matchExpressions: {
                                        description: 'matchExpressions is a list of label selector requirements. The requirements are ANDed.',
                                        items: {
                                          description: 'A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values.',
                                          properties: {
                                            key: {
                                              description: 'key is the label key that the selector applies to.',
                                              type: 'string',
                                            },
                                            operator: {
                                              description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist.",
                                              type: 'string',
                                            },
                                            values: {
                                              description: 'values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.',
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                          },
                                          required: [
                                            'key',
                                            'operator',
                                          ],
                                          type: 'object',
                                        },
                                        type: 'array',
                                      },
                                      matchLabels: {
                                        additionalProperties: {
                                          type: 'string',
                                        },
                                        description: 'matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.',
                                        type: 'object',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  storageClassName: {
                                    description: 'Name of the StorageClass required by the claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1',
                                    type: 'string',
                                  },
                                  volumeMode: {
                                    description: 'volumeMode defines what type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec.',
                                    type: 'string',
                                  },
                                  volumeName: {
                                    description: 'VolumeName is the binding reference to the PersistentVolume backing this claim.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              status: {
                                description: 'Status represents the current information/status of a persistent volume claim. Read-only. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims',
                                properties: {
                                  accessModes: {
                                    description: 'AccessModes contains the actual access modes the volume backing the PVC has. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1',
                                    items: {
                                      type: 'string',
                                    },
                                    type: 'array',
                                  },
                                  capacity: {
                                    additionalProperties: {
                                      anyOf: [
                                        {
                                          type: 'integer',
                                        },
                                        {
                                          type: 'string',
                                        },
                                      ],
                                      pattern: '^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$',
                                      'x-kubernetes-int-or-string': true,
                                    },
                                    description: 'Represents the actual resources of the underlying volume.',
                                    type: 'object',
                                  },
                                  conditions: {
                                    description: "Current Condition of persistent volume claim. If underlying persistent volume is being resized then the Condition will be set to 'ResizeStarted'.",
                                    items: {
                                      description: 'PersistentVolumeClaimCondition contails details about state of pvc',
                                      properties: {
                                        lastProbeTime: {
                                          description: 'Last time we probed the condition.',
                                          format: 'date-time',
                                          type: 'string',
                                        },
                                        lastTransitionTime: {
                                          description: 'Last time the condition transitioned from one status to another.',
                                          format: 'date-time',
                                          type: 'string',
                                        },
                                        message: {
                                          description: 'Human-readable message indicating details about last transition.',
                                          type: 'string',
                                        },
                                        reason: {
                                          description: "Unique, this should be a short, machine understandable string that gives the reason for condition's last transition. If it reports \"ResizeStarted\" that means the underlying persistent volume is being resized.",
                                          type: 'string',
                                        },
                                        status: {
                                          type: 'string',
                                        },
                                        type: {
                                          description: 'PersistentVolumeClaimConditionType is a valid value of PersistentVolumeClaimCondition.Type',
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'status',
                                        'type',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  phase: {
                                    description: 'Phase represents the current phase of PersistentVolumeClaim.',
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          type: 'array',
                        },
                      },
                      required: [
                        'count',
                        'name',
                      ],
                      type: 'object',
                    },
                    minItems: 1,
                    type: 'array',
                  },
                  podDisruptionBudget: {
                    description: 'PodDisruptionBudget provides access to the default pod disruption budget for the Elasticsearch cluster. The default budget selects all cluster pods and sets `maxUnavailable` to 1. To disable, set `PodDisruptionBudget` to the empty value (`{}` in YAML).',
                    properties: {
                      metadata: {
                        description: 'ObjectMeta is the metadata of the PDB. The name and namespace provided here are managed by ECK and will be ignored.',
                        properties: {
                          annotations: {
                            additionalProperties: {
                              type: 'string',
                            },
                            type: 'object',
                          },
                          finalizers: {
                            items: {
                              type: 'string',
                            },
                            type: 'array',
                          },
                          labels: {
                            additionalProperties: {
                              type: 'string',
                            },
                            type: 'object',
                          },
                          name: {
                            type: 'string',
                          },
                          namespace: {
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      spec: {
                        description: 'Spec is the specification of the PDB.',
                        properties: {
                          maxUnavailable: {
                            anyOf: [
                              {
                                type: 'integer',
                              },
                              {
                                type: 'string',
                              },
                            ],
                            description: 'An eviction is allowed if at most "maxUnavailable" pods selected by "selector" are unavailable after the eviction, i.e. even in absence of the evicted pod. For example, one can prevent all voluntary evictions by specifying 0. This is a mutually exclusive setting with "minAvailable".',
                            'x-kubernetes-int-or-string': true,
                          },
                          minAvailable: {
                            anyOf: [
                              {
                                type: 'integer',
                              },
                              {
                                type: 'string',
                              },
                            ],
                            description: 'An eviction is allowed if at least "minAvailable" pods selected by "selector" will still be available after the eviction, i.e. even in the absence of the evicted pod.  So for example you can prevent all voluntary evictions by specifying "100%".',
                            'x-kubernetes-int-or-string': true,
                          },
                          selector: {
                            description: 'Label query over pods whose evictions are managed by the disruption budget. A null selector selects no pods. An empty selector ({}) also selects no pods, which differs from standard behavior of selecting all pods. In policy/v1, an empty selector will select all pods in the namespace.',
                            properties: {
                              matchExpressions: {
                                description: 'matchExpressions is a list of label selector requirements. The requirements are ANDed.',
                                items: {
                                  description: 'A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values.',
                                  properties: {
                                    key: {
                                      description: 'key is the label key that the selector applies to.',
                                      type: 'string',
                                    },
                                    operator: {
                                      description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist.",
                                      type: 'string',
                                    },
                                    values: {
                                      description: 'values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.',
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                  },
                                  required: [
                                    'key',
                                    'operator',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              matchLabels: {
                                additionalProperties: {
                                  type: 'string',
                                },
                                description: 'matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.',
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  secureSettings: {
                    description: 'SecureSettings is a list of references to Kubernetes secrets containing sensitive configuration options for Elasticsearch.',
                    items: {
                      description: 'SecretSource defines a data source based on a Kubernetes Secret.',
                      properties: {
                        entries: {
                          description: 'Entries define how to project each key-value pair in the secret to filesystem paths. If not defined, all keys will be projected to similarly named paths in the filesystem. If defined, only the specified keys will be projected to the corresponding paths.',
                          items: {
                            description: 'KeyToPath defines how to map a key in a Secret object to a filesystem path.',
                            properties: {
                              key: {
                                description: 'Key is the key contained in the secret.',
                                type: 'string',
                              },
                              path: {
                                description: 'Path is the relative file path to map the key to. Path must not be an absolute file path and must not contain any ".." components.',
                                type: 'string',
                              },
                            },
                            required: [
                              'key',
                            ],
                            type: 'object',
                          },
                          type: 'array',
                        },
                        secretName: {
                          description: 'SecretName is the name of the secret.',
                          type: 'string',
                        },
                      },
                      required: [
                        'secretName',
                      ],
                      type: 'object',
                    },
                    type: 'array',
                  },
                  updateStrategy: {
                    description: 'UpdateStrategy specifies how updates to the cluster should be performed.',
                    properties: {
                      changeBudget: {
                        description: 'ChangeBudget defines the constraints to consider when applying changes to the Elasticsearch cluster.',
                        properties: {
                          maxSurge: {
                            description: 'MaxSurge is the maximum number of new pods that can be created exceeding the original number of pods defined in the specification. MaxSurge is only taken into consideration when scaling up. Setting a negative value will disable the restriction. Defaults to unbounded if not specified.',
                            format: 'int32',
                            type: 'integer',
                          },
                          maxUnavailable: {
                            description: 'MaxUnavailable is the maximum number of pods that can be unavailable (not ready) during the update due to circumstances under the control of the operator. Setting a negative value will disable this restriction. Defaults to 1 if not specified.',
                            format: 'int32',
                            type: 'integer',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  version: {
                    description: 'Version of Elasticsearch.',
                    type: 'string',
                  },
                },
                required: [
                  'nodeSets',
                ],
                type: 'object',
              },
              status: {
                description: 'ElasticsearchStatus defines the observed state of Elasticsearch',
                properties: {
                  availableNodes: {
                    format: 'int32',
                    type: 'integer',
                  },
                  health: {
                    description: 'ElasticsearchHealth is the health of the cluster as returned by the health API.',
                    type: 'string',
                  },
                  phase: {
                    description: 'ElasticsearchOrchestrationPhase is the phase Elasticsearch is in from the controller point of view.',
                    type: 'string',
                  },
                },
                type: 'object',
              },
            },
            type: 'object',
          },
        },
        served: true,
        storage: false,
        subresources: {
          status: {},
        },
      },
      {
        name: 'v1alpha1',
        schema: {
          openAPIV3Schema: {
            description: 'to not break compatibility when upgrading from previous versions of the CRD',
            type: 'object',
          },
        },
        served: false,
        storage: false,
      },
    ],
  },
  status: {
    acceptedNames: {
      kind: '',
      plural: '',
    },
    conditions: [],
    storedVersions: [],
  },
}
