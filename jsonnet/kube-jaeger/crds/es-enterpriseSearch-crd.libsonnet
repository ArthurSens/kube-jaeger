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
    name: 'enterprisesearches.enterprisesearch.k8s.elastic.co',
  },
  spec: {
    group: 'enterprisesearch.k8s.elastic.co',
    names: {
      categories: [
        'elastic',
      ],
      kind: 'EnterpriseSearch',
      listKind: 'EnterpriseSearchList',
      plural: 'enterprisesearches',
      shortNames: [
        'ent',
      ],
      singular: 'enterprisesearch',
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
            description: 'Enterprise Search version',
            jsonPath: '.status.version',
            name: 'version',
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
            description: 'EnterpriseSearch is a Kubernetes CRD to represent Enterprise Search.',
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
                description: 'EnterpriseSearchSpec holds the specification of an Enterprise Search resource.',
                properties: {
                  config: {
                    description: 'Config holds the Enterprise Search configuration.',
                    type: 'object',
                    'x-kubernetes-preserve-unknown-fields': true,
                  },
                  configRef: {
                    description: 'ConfigRef contains a reference to an existing Kubernetes Secret holding the Enterprise Search configuration. Configuration settings are merged and have precedence over settings specified in `config`.',
                    properties: {
                      secretName: {
                        description: 'SecretName is the name of the secret.',
                        type: 'string',
                      },
                    },
                    type: 'object',
                  },
                  count: {
                    description: 'Count of Enterprise Search instances to deploy.',
                    format: 'int32',
                    type: 'integer',
                  },
                  elasticsearchRef: {
                    description: 'ElasticsearchRef is a reference to the Elasticsearch cluster running in the same Kubernetes cluster.',
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
                  http: {
                    description: 'HTTP holds the HTTP layer configuration for Enterprise Search resource.',
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
                    description: 'Image is the Enterprise Search Docker image to deploy.',
                    type: 'string',
                  },
                  podTemplate: {
                    description: 'PodTemplate provides customisation options (labels, annotations, affinity rules, resource requests, and so on) for the Enterprise Search pods.',
                    type: 'object',
                    'x-kubernetes-preserve-unknown-fields': true,
                  },
                  serviceAccountName: {
                    description: 'ServiceAccountName is used to check access from the current resource to a resource (eg. Elasticsearch) in a different namespace. Can only be used if ECK is enforcing RBAC on references.',
                    type: 'string',
                  },
                  version: {
                    description: 'Version of Enterprise Search.',
                    type: 'string',
                  },
                },
                type: 'object',
              },
              status: {
                description: 'EnterpriseSearchStatus defines the observed state of EnterpriseSearch',
                properties: {
                  associationStatus: {
                    description: 'Association is the status of any auto-linking to Elasticsearch clusters.',
                    type: 'string',
                  },
                  availableNodes: {
                    description: 'AvailableNodes is the number of available replicas in the deployment.',
                    format: 'int32',
                    type: 'integer',
                  },
                  count: {
                    description: 'Count corresponds to Scale.Status.Replicas, which is the actual number of observed instances of the scaled object.',
                    format: 'int32',
                    type: 'integer',
                  },
                  health: {
                    description: 'Health of the deployment.',
                    type: 'string',
                  },
                  selector: {
                    description: 'Selector is the label selector used to find all pods.',
                    type: 'string',
                  },
                  service: {
                    description: 'ExternalService is the name of the service associated to the Enterprise Search Pods.',
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
          scale: {
            labelSelectorPath: '.status.selector',
            specReplicasPath: '.spec.count',
            statusReplicasPath: '.status.count',
          },
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
            description: 'Enterprise Search version',
            jsonPath: '.status.version',
            name: 'version',
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
            description: 'EnterpriseSearch is a Kubernetes CRD to represent Enterprise Search.',
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
                description: 'EnterpriseSearchSpec holds the specification of an Enterprise Search resource.',
                properties: {
                  config: {
                    description: 'Config holds the Enterprise Search configuration.',
                    type: 'object',
                    'x-kubernetes-preserve-unknown-fields': true,
                  },
                  configRef: {
                    description: 'ConfigRef contains a reference to an existing Kubernetes Secret holding the Enterprise Search configuration. Configuration settings are merged and have precedence over settings specified in `config`.',
                    properties: {
                      secretName: {
                        description: 'SecretName is the name of the secret.',
                        type: 'string',
                      },
                    },
                    type: 'object',
                  },
                  count: {
                    description: 'Count of Enterprise Search instances to deploy.',
                    format: 'int32',
                    type: 'integer',
                  },
                  elasticsearchRef: {
                    description: 'ElasticsearchRef is a reference to the Elasticsearch cluster running in the same Kubernetes cluster.',
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
                  http: {
                    description: 'HTTP holds the HTTP layer configuration for Enterprise Search resource.',
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
                    description: 'Image is the Enterprise Search Docker image to deploy.',
                    type: 'string',
                  },
                  podTemplate: {
                    description: 'PodTemplate provides customisation options (labels, annotations, affinity rules, resource requests, and so on) for the Enterprise Search pods.',
                    type: 'object',
                    'x-kubernetes-preserve-unknown-fields': true,
                  },
                  serviceAccountName: {
                    description: 'ServiceAccountName is used to check access from the current resource to a resource (eg. Elasticsearch) in a different namespace. Can only be used if ECK is enforcing RBAC on references.',
                    type: 'string',
                  },
                  version: {
                    description: 'Version of Enterprise Search.',
                    type: 'string',
                  },
                },
                type: 'object',
              },
              status: {
                description: 'EnterpriseSearchStatus defines the observed state of EnterpriseSearch',
                properties: {
                  associationStatus: {
                    description: 'Association is the status of any auto-linking to Elasticsearch clusters.',
                    type: 'string',
                  },
                  availableNodes: {
                    description: 'AvailableNodes is the number of available replicas in the deployment.',
                    format: 'int32',
                    type: 'integer',
                  },
                  count: {
                    description: 'Count corresponds to Scale.Status.Replicas, which is the actual number of observed instances of the scaled object.',
                    format: 'int32',
                    type: 'integer',
                  },
                  health: {
                    description: 'Health of the deployment.',
                    type: 'string',
                  },
                  selector: {
                    description: 'Selector is the label selector used to find all pods.',
                    type: 'string',
                  },
                  service: {
                    description: 'ExternalService is the name of the service associated to the Enterprise Search Pods.',
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
        storage: false,
        subresources: {
          status: {},
        },
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
