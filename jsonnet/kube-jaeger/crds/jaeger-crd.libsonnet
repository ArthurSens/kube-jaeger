{
  apiVersion: 'apiextensions.k8s.io/v1',
  kind: 'CustomResourceDefinition',
  metadata: {
    annotations: {
      'controller-gen.kubebuilder.io/version': 'v0.5.0',
    },
    creationTimestamp: null,
    name: 'jaegers.jaegertracing.io',
  },
  spec: {
    group: 'jaegertracing.io',
    names: {
      kind: 'Jaeger',
      listKind: 'JaegerList',
      plural: 'jaegers',
      singular: 'jaeger',
    },
    scope: 'Namespaced',
    versions: [
      {
        additionalPrinterColumns: [
          {
            description: "Jaeger instance's status",
            jsonPath: '.status.phase',
            name: 'Status',
            type: 'string',
          },
          {
            description: 'Jaeger Version',
            jsonPath: '.status.version',
            name: 'Version',
            type: 'string',
          },
          {
            description: 'Jaeger deployment strategy',
            jsonPath: '.spec.strategy',
            name: 'Strategy',
            type: 'string',
          },
          {
            description: 'Jaeger storage type',
            jsonPath: '.spec.storage.type',
            name: 'Storage',
            type: 'string',
          },
          {
            jsonPath: '.metadata.creationTimestamp',
            name: 'Age',
            type: 'date',
          },
        ],
        name: 'v1',
        schema: {
          openAPIV3Schema: {
            properties: {
              apiVersion: {
                type: 'string',
              },
              kind: {
                type: 'string',
              },
              metadata: {
                type: 'object',
              },
              spec: {
                properties: {
                  affinity: {
                    properties: {
                      nodeAffinity: {
                        properties: {
                          preferredDuringSchedulingIgnoredDuringExecution: {
                            items: {
                              properties: {
                                preference: {
                                  properties: {
                                    matchExpressions: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          operator: {
                                            type: 'string',
                                          },
                                          values: {
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
                                    matchFields: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          operator: {
                                            type: 'string',
                                          },
                                          values: {
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
                                  },
                                  type: 'object',
                                },
                                weight: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                              },
                              required: [
                                'preference',
                                'weight',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          requiredDuringSchedulingIgnoredDuringExecution: {
                            properties: {
                              nodeSelectorTerms: {
                                items: {
                                  properties: {
                                    matchExpressions: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          operator: {
                                            type: 'string',
                                          },
                                          values: {
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
                                    matchFields: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          operator: {
                                            type: 'string',
                                          },
                                          values: {
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
                                  },
                                  type: 'object',
                                },
                                type: 'array',
                              },
                            },
                            required: [
                              'nodeSelectorTerms',
                            ],
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      podAffinity: {
                        properties: {
                          preferredDuringSchedulingIgnoredDuringExecution: {
                            items: {
                              properties: {
                                podAffinityTerm: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
                                  ],
                                  type: 'object',
                                },
                                weight: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                              },
                              required: [
                                'podAffinityTerm',
                                'weight',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          requiredDuringSchedulingIgnoredDuringExecution: {
                            items: {
                              properties: {
                                labelSelector: {
                                  properties: {
                                    matchExpressions: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          operator: {
                                            type: 'string',
                                          },
                                          values: {
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
                                      type: 'object',
                                    },
                                  },
                                  type: 'object',
                                },
                                namespaces: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                topologyKey: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'topologyKey',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                        },
                        type: 'object',
                      },
                      podAntiAffinity: {
                        properties: {
                          preferredDuringSchedulingIgnoredDuringExecution: {
                            items: {
                              properties: {
                                podAffinityTerm: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
                                  ],
                                  type: 'object',
                                },
                                weight: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                              },
                              required: [
                                'podAffinityTerm',
                                'weight',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          requiredDuringSchedulingIgnoredDuringExecution: {
                            items: {
                              properties: {
                                labelSelector: {
                                  properties: {
                                    matchExpressions: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          operator: {
                                            type: 'string',
                                          },
                                          values: {
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
                                      type: 'object',
                                    },
                                  },
                                  type: 'object',
                                },
                                namespaces: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                topologyKey: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'topologyKey',
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
                  agent: {
                    nullable: true,
                    properties: {
                      affinity: {
                        properties: {
                          nodeAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    preference: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'preference',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                properties: {
                                  nodeSelectorTerms: {
                                    items: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                },
                                required: [
                                  'nodeSelectorTerms',
                                ],
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          podAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                            },
                            type: 'object',
                          },
                          podAntiAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
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
                      annotations: {
                        additionalProperties: {
                          type: 'string',
                        },
                        nullable: true,
                        type: 'object',
                      },
                      config: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                      dnsPolicy: {
                        type: 'string',
                      },
                      hostNetwork: {
                        type: 'boolean',
                      },
                      image: {
                        type: 'string',
                      },
                      imagePullSecrets: {
                        items: {
                          properties: {
                            name: {
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      labels: {
                        additionalProperties: {
                          type: 'string',
                        },
                        type: 'object',
                      },
                      options: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                      priorityClassName: {
                        type: 'string',
                      },
                      resources: {
                        nullable: true,
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
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      securityContext: {
                        properties: {
                          fsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          fsGroupChangePolicy: {
                            type: 'string',
                          },
                          runAsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          runAsNonRoot: {
                            type: 'boolean',
                          },
                          runAsUser: {
                            format: 'int64',
                            type: 'integer',
                          },
                          seLinuxOptions: {
                            properties: {
                              level: {
                                type: 'string',
                              },
                              role: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                              user: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          seccompProfile: {
                            properties: {
                              localhostProfile: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                            },
                            required: [
                              'type',
                            ],
                            type: 'object',
                          },
                          supplementalGroups: {
                            items: {
                              format: 'int64',
                              type: 'integer',
                            },
                            type: 'array',
                          },
                          sysctls: {
                            items: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                                value: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'name',
                                'value',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          windowsOptions: {
                            properties: {
                              gmsaCredentialSpec: {
                                type: 'string',
                              },
                              gmsaCredentialSpecName: {
                                type: 'string',
                              },
                              runAsUserName: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      serviceAccount: {
                        type: 'string',
                      },
                      sidecarSecurityContext: {
                        properties: {
                          allowPrivilegeEscalation: {
                            type: 'boolean',
                          },
                          capabilities: {
                            properties: {
                              add: {
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              drop: {
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                            },
                            type: 'object',
                          },
                          privileged: {
                            type: 'boolean',
                          },
                          procMount: {
                            type: 'string',
                          },
                          readOnlyRootFilesystem: {
                            type: 'boolean',
                          },
                          runAsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          runAsNonRoot: {
                            type: 'boolean',
                          },
                          runAsUser: {
                            format: 'int64',
                            type: 'integer',
                          },
                          seLinuxOptions: {
                            properties: {
                              level: {
                                type: 'string',
                              },
                              role: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                              user: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          seccompProfile: {
                            properties: {
                              localhostProfile: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                            },
                            required: [
                              'type',
                            ],
                            type: 'object',
                          },
                          windowsOptions: {
                            properties: {
                              gmsaCredentialSpec: {
                                type: 'string',
                              },
                              gmsaCredentialSpecName: {
                                type: 'string',
                              },
                              runAsUserName: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      strategy: {
                        type: 'string',
                      },
                      tolerations: {
                        items: {
                          properties: {
                            effect: {
                              type: 'string',
                            },
                            key: {
                              type: 'string',
                            },
                            operator: {
                              type: 'string',
                            },
                            tolerationSeconds: {
                              format: 'int64',
                              type: 'integer',
                            },
                            value: {
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      volumeMounts: {
                        items: {
                          properties: {
                            mountPath: {
                              type: 'string',
                            },
                            mountPropagation: {
                              type: 'string',
                            },
                            name: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            subPath: {
                              type: 'string',
                            },
                            subPathExpr: {
                              type: 'string',
                            },
                          },
                          required: [
                            'mountPath',
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      volumes: {
                        items: {
                          properties: {
                            awsElasticBlockStore: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            azureDisk: {
                              properties: {
                                cachingMode: {
                                  type: 'string',
                                },
                                diskName: {
                                  type: 'string',
                                },
                                diskURI: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                kind: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'diskName',
                                'diskURI',
                              ],
                              type: 'object',
                            },
                            azureFile: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                                shareName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'secretName',
                                'shareName',
                              ],
                              type: 'object',
                            },
                            cephfs: {
                              properties: {
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretFile: {
                                  type: 'string',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'monitors',
                              ],
                              type: 'object',
                            },
                            cinder: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            configMap: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                name: {
                                  type: 'string',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                              },
                              type: 'object',
                            },
                            csi: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                nodePublishSecretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeAttributes: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            downwardAPI: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      fieldRef: {
                                        properties: {
                                          apiVersion: {
                                            type: 'string',
                                          },
                                          fieldPath: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'fieldPath',
                                        ],
                                        type: 'object',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                      resourceFieldRef: {
                                        properties: {
                                          containerName: {
                                            type: 'string',
                                          },
                                          divisor: {
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
                                          resource: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'resource',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    required: [
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            emptyDir: {
                              properties: {
                                medium: {
                                  type: 'string',
                                },
                                sizeLimit: {
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
                              },
                              type: 'object',
                            },
                            ephemeral: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeClaimTemplate: {
                                  properties: {
                                    metadata: {
                                      type: 'object',
                                    },
                                    spec: {
                                      properties: {
                                        accessModes: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        dataSource: {
                                          properties: {
                                            apiGroup: {
                                              type: 'string',
                                            },
                                            kind: {
                                              type: 'string',
                                            },
                                            name: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        selector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        storageClassName: {
                                          type: 'string',
                                        },
                                        volumeMode: {
                                          type: 'string',
                                        },
                                        volumeName: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'spec',
                                  ],
                                  type: 'object',
                                },
                              },
                              type: 'object',
                            },
                            fc: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                targetWWNs: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                wwids: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            flexVolume: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                options: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            flocker: {
                              properties: {
                                datasetName: {
                                  type: 'string',
                                },
                                datasetUUID: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            gcePersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                pdName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'pdName',
                              ],
                              type: 'object',
                            },
                            gitRepo: {
                              properties: {
                                directory: {
                                  type: 'string',
                                },
                                repository: {
                                  type: 'string',
                                },
                                revision: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'repository',
                              ],
                              type: 'object',
                            },
                            glusterfs: {
                              properties: {
                                endpoints: {
                                  type: 'string',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'endpoints',
                                'path',
                              ],
                              type: 'object',
                            },
                            hostPath: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                type: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                              ],
                              type: 'object',
                            },
                            iscsi: {
                              properties: {
                                chapAuthDiscovery: {
                                  type: 'boolean',
                                },
                                chapAuthSession: {
                                  type: 'boolean',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                initiatorName: {
                                  type: 'string',
                                },
                                iqn: {
                                  type: 'string',
                                },
                                iscsiInterface: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                portals: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                targetPortal: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'iqn',
                                'lun',
                                'targetPortal',
                              ],
                              type: 'object',
                            },
                            name: {
                              type: 'string',
                            },
                            nfs: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                server: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                                'server',
                              ],
                              type: 'object',
                            },
                            persistentVolumeClaim: {
                              properties: {
                                claimName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'claimName',
                              ],
                              type: 'object',
                            },
                            photonPersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                pdID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'pdID',
                              ],
                              type: 'object',
                            },
                            portworxVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            projected: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                sources: {
                                  items: {
                                    properties: {
                                      configMap: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      downwardAPI: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                fieldRef: {
                                                  properties: {
                                                    apiVersion: {
                                                      type: 'string',
                                                    },
                                                    fieldPath: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'fieldPath',
                                                  ],
                                                  type: 'object',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                                resourceFieldRef: {
                                                  properties: {
                                                    containerName: {
                                                      type: 'string',
                                                    },
                                                    divisor: {
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
                                                    resource: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'resource',
                                                  ],
                                                  type: 'object',
                                                },
                                              },
                                              required: [
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      secret: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      serviceAccountToken: {
                                        properties: {
                                          audience: {
                                            type: 'string',
                                          },
                                          expirationSeconds: {
                                            format: 'int64',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            quobyte: {
                              properties: {
                                group: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                registry: {
                                  type: 'string',
                                },
                                tenant: {
                                  type: 'string',
                                },
                                user: {
                                  type: 'string',
                                },
                                volume: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'registry',
                                'volume',
                              ],
                              type: 'object',
                            },
                            rbd: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                image: {
                                  type: 'string',
                                },
                                keyring: {
                                  type: 'string',
                                },
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                pool: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'image',
                                'monitors',
                              ],
                              type: 'object',
                            },
                            scaleIO: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                gateway: {
                                  type: 'string',
                                },
                                protectionDomain: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                sslEnabled: {
                                  type: 'boolean',
                                },
                                storageMode: {
                                  type: 'string',
                                },
                                storagePool: {
                                  type: 'string',
                                },
                                system: {
                                  type: 'string',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'gateway',
                                'secretRef',
                                'system',
                              ],
                              type: 'object',
                            },
                            secret: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            storageos: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                                volumeNamespace: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            vsphereVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                storagePolicyID: {
                                  type: 'string',
                                },
                                storagePolicyName: {
                                  type: 'string',
                                },
                                volumePath: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumePath',
                              ],
                              type: 'object',
                            },
                          },
                          required: [
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                    },
                    type: 'object',
                  },
                  allInOne: {
                    properties: {
                      affinity: {
                        properties: {
                          nodeAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    preference: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'preference',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                properties: {
                                  nodeSelectorTerms: {
                                    items: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                },
                                required: [
                                  'nodeSelectorTerms',
                                ],
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          podAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                            },
                            type: 'object',
                          },
                          podAntiAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
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
                      annotations: {
                        additionalProperties: {
                          type: 'string',
                        },
                        nullable: true,
                        type: 'object',
                      },
                      config: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                      image: {
                        type: 'string',
                      },
                      labels: {
                        additionalProperties: {
                          type: 'string',
                        },
                        type: 'object',
                      },
                      options: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                      resources: {
                        nullable: true,
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
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      securityContext: {
                        properties: {
                          fsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          fsGroupChangePolicy: {
                            type: 'string',
                          },
                          runAsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          runAsNonRoot: {
                            type: 'boolean',
                          },
                          runAsUser: {
                            format: 'int64',
                            type: 'integer',
                          },
                          seLinuxOptions: {
                            properties: {
                              level: {
                                type: 'string',
                              },
                              role: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                              user: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          seccompProfile: {
                            properties: {
                              localhostProfile: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                            },
                            required: [
                              'type',
                            ],
                            type: 'object',
                          },
                          supplementalGroups: {
                            items: {
                              format: 'int64',
                              type: 'integer',
                            },
                            type: 'array',
                          },
                          sysctls: {
                            items: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                                value: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'name',
                                'value',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          windowsOptions: {
                            properties: {
                              gmsaCredentialSpec: {
                                type: 'string',
                              },
                              gmsaCredentialSpecName: {
                                type: 'string',
                              },
                              runAsUserName: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      serviceAccount: {
                        type: 'string',
                      },
                      strategy: {
                        properties: {
                          rollingUpdate: {
                            properties: {
                              maxSurge: {
                                anyOf: [
                                  {
                                    type: 'integer',
                                  },
                                  {
                                    type: 'string',
                                  },
                                ],
                                'x-kubernetes-int-or-string': true,
                              },
                              maxUnavailable: {
                                anyOf: [
                                  {
                                    type: 'integer',
                                  },
                                  {
                                    type: 'string',
                                  },
                                ],
                                'x-kubernetes-int-or-string': true,
                              },
                            },
                            type: 'object',
                          },
                          type: {
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      tolerations: {
                        items: {
                          properties: {
                            effect: {
                              type: 'string',
                            },
                            key: {
                              type: 'string',
                            },
                            operator: {
                              type: 'string',
                            },
                            tolerationSeconds: {
                              format: 'int64',
                              type: 'integer',
                            },
                            value: {
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      tracingEnabled: {
                        type: 'boolean',
                      },
                      volumeMounts: {
                        items: {
                          properties: {
                            mountPath: {
                              type: 'string',
                            },
                            mountPropagation: {
                              type: 'string',
                            },
                            name: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            subPath: {
                              type: 'string',
                            },
                            subPathExpr: {
                              type: 'string',
                            },
                          },
                          required: [
                            'mountPath',
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      volumes: {
                        items: {
                          properties: {
                            awsElasticBlockStore: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            azureDisk: {
                              properties: {
                                cachingMode: {
                                  type: 'string',
                                },
                                diskName: {
                                  type: 'string',
                                },
                                diskURI: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                kind: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'diskName',
                                'diskURI',
                              ],
                              type: 'object',
                            },
                            azureFile: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                                shareName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'secretName',
                                'shareName',
                              ],
                              type: 'object',
                            },
                            cephfs: {
                              properties: {
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretFile: {
                                  type: 'string',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'monitors',
                              ],
                              type: 'object',
                            },
                            cinder: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            configMap: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                name: {
                                  type: 'string',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                              },
                              type: 'object',
                            },
                            csi: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                nodePublishSecretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeAttributes: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            downwardAPI: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      fieldRef: {
                                        properties: {
                                          apiVersion: {
                                            type: 'string',
                                          },
                                          fieldPath: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'fieldPath',
                                        ],
                                        type: 'object',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                      resourceFieldRef: {
                                        properties: {
                                          containerName: {
                                            type: 'string',
                                          },
                                          divisor: {
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
                                          resource: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'resource',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    required: [
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            emptyDir: {
                              properties: {
                                medium: {
                                  type: 'string',
                                },
                                sizeLimit: {
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
                              },
                              type: 'object',
                            },
                            ephemeral: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeClaimTemplate: {
                                  properties: {
                                    metadata: {
                                      type: 'object',
                                    },
                                    spec: {
                                      properties: {
                                        accessModes: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        dataSource: {
                                          properties: {
                                            apiGroup: {
                                              type: 'string',
                                            },
                                            kind: {
                                              type: 'string',
                                            },
                                            name: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        selector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        storageClassName: {
                                          type: 'string',
                                        },
                                        volumeMode: {
                                          type: 'string',
                                        },
                                        volumeName: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'spec',
                                  ],
                                  type: 'object',
                                },
                              },
                              type: 'object',
                            },
                            fc: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                targetWWNs: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                wwids: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            flexVolume: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                options: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            flocker: {
                              properties: {
                                datasetName: {
                                  type: 'string',
                                },
                                datasetUUID: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            gcePersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                pdName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'pdName',
                              ],
                              type: 'object',
                            },
                            gitRepo: {
                              properties: {
                                directory: {
                                  type: 'string',
                                },
                                repository: {
                                  type: 'string',
                                },
                                revision: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'repository',
                              ],
                              type: 'object',
                            },
                            glusterfs: {
                              properties: {
                                endpoints: {
                                  type: 'string',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'endpoints',
                                'path',
                              ],
                              type: 'object',
                            },
                            hostPath: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                type: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                              ],
                              type: 'object',
                            },
                            iscsi: {
                              properties: {
                                chapAuthDiscovery: {
                                  type: 'boolean',
                                },
                                chapAuthSession: {
                                  type: 'boolean',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                initiatorName: {
                                  type: 'string',
                                },
                                iqn: {
                                  type: 'string',
                                },
                                iscsiInterface: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                portals: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                targetPortal: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'iqn',
                                'lun',
                                'targetPortal',
                              ],
                              type: 'object',
                            },
                            name: {
                              type: 'string',
                            },
                            nfs: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                server: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                                'server',
                              ],
                              type: 'object',
                            },
                            persistentVolumeClaim: {
                              properties: {
                                claimName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'claimName',
                              ],
                              type: 'object',
                            },
                            photonPersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                pdID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'pdID',
                              ],
                              type: 'object',
                            },
                            portworxVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            projected: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                sources: {
                                  items: {
                                    properties: {
                                      configMap: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      downwardAPI: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                fieldRef: {
                                                  properties: {
                                                    apiVersion: {
                                                      type: 'string',
                                                    },
                                                    fieldPath: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'fieldPath',
                                                  ],
                                                  type: 'object',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                                resourceFieldRef: {
                                                  properties: {
                                                    containerName: {
                                                      type: 'string',
                                                    },
                                                    divisor: {
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
                                                    resource: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'resource',
                                                  ],
                                                  type: 'object',
                                                },
                                              },
                                              required: [
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      secret: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      serviceAccountToken: {
                                        properties: {
                                          audience: {
                                            type: 'string',
                                          },
                                          expirationSeconds: {
                                            format: 'int64',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            quobyte: {
                              properties: {
                                group: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                registry: {
                                  type: 'string',
                                },
                                tenant: {
                                  type: 'string',
                                },
                                user: {
                                  type: 'string',
                                },
                                volume: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'registry',
                                'volume',
                              ],
                              type: 'object',
                            },
                            rbd: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                image: {
                                  type: 'string',
                                },
                                keyring: {
                                  type: 'string',
                                },
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                pool: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'image',
                                'monitors',
                              ],
                              type: 'object',
                            },
                            scaleIO: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                gateway: {
                                  type: 'string',
                                },
                                protectionDomain: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                sslEnabled: {
                                  type: 'boolean',
                                },
                                storageMode: {
                                  type: 'string',
                                },
                                storagePool: {
                                  type: 'string',
                                },
                                system: {
                                  type: 'string',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'gateway',
                                'secretRef',
                                'system',
                              ],
                              type: 'object',
                            },
                            secret: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            storageos: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                                volumeNamespace: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            vsphereVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                storagePolicyID: {
                                  type: 'string',
                                },
                                storagePolicyName: {
                                  type: 'string',
                                },
                                volumePath: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumePath',
                              ],
                              type: 'object',
                            },
                          },
                          required: [
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                    },
                    type: 'object',
                  },
                  annotations: {
                    additionalProperties: {
                      type: 'string',
                    },
                    nullable: true,
                    type: 'object',
                  },
                  collector: {
                    properties: {
                      affinity: {
                        properties: {
                          nodeAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    preference: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'preference',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                properties: {
                                  nodeSelectorTerms: {
                                    items: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                },
                                required: [
                                  'nodeSelectorTerms',
                                ],
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          podAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                            },
                            type: 'object',
                          },
                          podAntiAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
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
                      annotations: {
                        additionalProperties: {
                          type: 'string',
                        },
                        nullable: true,
                        type: 'object',
                      },
                      autoscale: {
                        type: 'boolean',
                      },
                      config: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                      image: {
                        type: 'string',
                      },
                      labels: {
                        additionalProperties: {
                          type: 'string',
                        },
                        type: 'object',
                      },
                      maxReplicas: {
                        format: 'int32',
                        type: 'integer',
                      },
                      minReplicas: {
                        format: 'int32',
                        type: 'integer',
                      },
                      options: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                      priorityClassName: {
                        type: 'string',
                      },
                      replicas: {
                        format: 'int32',
                        type: 'integer',
                      },
                      resources: {
                        nullable: true,
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
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      securityContext: {
                        properties: {
                          fsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          fsGroupChangePolicy: {
                            type: 'string',
                          },
                          runAsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          runAsNonRoot: {
                            type: 'boolean',
                          },
                          runAsUser: {
                            format: 'int64',
                            type: 'integer',
                          },
                          seLinuxOptions: {
                            properties: {
                              level: {
                                type: 'string',
                              },
                              role: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                              user: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          seccompProfile: {
                            properties: {
                              localhostProfile: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                            },
                            required: [
                              'type',
                            ],
                            type: 'object',
                          },
                          supplementalGroups: {
                            items: {
                              format: 'int64',
                              type: 'integer',
                            },
                            type: 'array',
                          },
                          sysctls: {
                            items: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                                value: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'name',
                                'value',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          windowsOptions: {
                            properties: {
                              gmsaCredentialSpec: {
                                type: 'string',
                              },
                              gmsaCredentialSpecName: {
                                type: 'string',
                              },
                              runAsUserName: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      serviceAccount: {
                        type: 'string',
                      },
                      serviceType: {
                        type: 'string',
                      },
                      strategy: {
                        properties: {
                          rollingUpdate: {
                            properties: {
                              maxSurge: {
                                anyOf: [
                                  {
                                    type: 'integer',
                                  },
                                  {
                                    type: 'string',
                                  },
                                ],
                                'x-kubernetes-int-or-string': true,
                              },
                              maxUnavailable: {
                                anyOf: [
                                  {
                                    type: 'integer',
                                  },
                                  {
                                    type: 'string',
                                  },
                                ],
                                'x-kubernetes-int-or-string': true,
                              },
                            },
                            type: 'object',
                          },
                          type: {
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      tolerations: {
                        items: {
                          properties: {
                            effect: {
                              type: 'string',
                            },
                            key: {
                              type: 'string',
                            },
                            operator: {
                              type: 'string',
                            },
                            tolerationSeconds: {
                              format: 'int64',
                              type: 'integer',
                            },
                            value: {
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      volumeMounts: {
                        items: {
                          properties: {
                            mountPath: {
                              type: 'string',
                            },
                            mountPropagation: {
                              type: 'string',
                            },
                            name: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            subPath: {
                              type: 'string',
                            },
                            subPathExpr: {
                              type: 'string',
                            },
                          },
                          required: [
                            'mountPath',
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      volumes: {
                        items: {
                          properties: {
                            awsElasticBlockStore: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            azureDisk: {
                              properties: {
                                cachingMode: {
                                  type: 'string',
                                },
                                diskName: {
                                  type: 'string',
                                },
                                diskURI: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                kind: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'diskName',
                                'diskURI',
                              ],
                              type: 'object',
                            },
                            azureFile: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                                shareName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'secretName',
                                'shareName',
                              ],
                              type: 'object',
                            },
                            cephfs: {
                              properties: {
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretFile: {
                                  type: 'string',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'monitors',
                              ],
                              type: 'object',
                            },
                            cinder: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            configMap: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                name: {
                                  type: 'string',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                              },
                              type: 'object',
                            },
                            csi: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                nodePublishSecretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeAttributes: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            downwardAPI: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      fieldRef: {
                                        properties: {
                                          apiVersion: {
                                            type: 'string',
                                          },
                                          fieldPath: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'fieldPath',
                                        ],
                                        type: 'object',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                      resourceFieldRef: {
                                        properties: {
                                          containerName: {
                                            type: 'string',
                                          },
                                          divisor: {
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
                                          resource: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'resource',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    required: [
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            emptyDir: {
                              properties: {
                                medium: {
                                  type: 'string',
                                },
                                sizeLimit: {
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
                              },
                              type: 'object',
                            },
                            ephemeral: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeClaimTemplate: {
                                  properties: {
                                    metadata: {
                                      type: 'object',
                                    },
                                    spec: {
                                      properties: {
                                        accessModes: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        dataSource: {
                                          properties: {
                                            apiGroup: {
                                              type: 'string',
                                            },
                                            kind: {
                                              type: 'string',
                                            },
                                            name: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        selector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        storageClassName: {
                                          type: 'string',
                                        },
                                        volumeMode: {
                                          type: 'string',
                                        },
                                        volumeName: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'spec',
                                  ],
                                  type: 'object',
                                },
                              },
                              type: 'object',
                            },
                            fc: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                targetWWNs: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                wwids: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            flexVolume: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                options: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            flocker: {
                              properties: {
                                datasetName: {
                                  type: 'string',
                                },
                                datasetUUID: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            gcePersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                pdName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'pdName',
                              ],
                              type: 'object',
                            },
                            gitRepo: {
                              properties: {
                                directory: {
                                  type: 'string',
                                },
                                repository: {
                                  type: 'string',
                                },
                                revision: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'repository',
                              ],
                              type: 'object',
                            },
                            glusterfs: {
                              properties: {
                                endpoints: {
                                  type: 'string',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'endpoints',
                                'path',
                              ],
                              type: 'object',
                            },
                            hostPath: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                type: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                              ],
                              type: 'object',
                            },
                            iscsi: {
                              properties: {
                                chapAuthDiscovery: {
                                  type: 'boolean',
                                },
                                chapAuthSession: {
                                  type: 'boolean',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                initiatorName: {
                                  type: 'string',
                                },
                                iqn: {
                                  type: 'string',
                                },
                                iscsiInterface: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                portals: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                targetPortal: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'iqn',
                                'lun',
                                'targetPortal',
                              ],
                              type: 'object',
                            },
                            name: {
                              type: 'string',
                            },
                            nfs: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                server: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                                'server',
                              ],
                              type: 'object',
                            },
                            persistentVolumeClaim: {
                              properties: {
                                claimName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'claimName',
                              ],
                              type: 'object',
                            },
                            photonPersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                pdID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'pdID',
                              ],
                              type: 'object',
                            },
                            portworxVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            projected: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                sources: {
                                  items: {
                                    properties: {
                                      configMap: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      downwardAPI: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                fieldRef: {
                                                  properties: {
                                                    apiVersion: {
                                                      type: 'string',
                                                    },
                                                    fieldPath: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'fieldPath',
                                                  ],
                                                  type: 'object',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                                resourceFieldRef: {
                                                  properties: {
                                                    containerName: {
                                                      type: 'string',
                                                    },
                                                    divisor: {
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
                                                    resource: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'resource',
                                                  ],
                                                  type: 'object',
                                                },
                                              },
                                              required: [
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      secret: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      serviceAccountToken: {
                                        properties: {
                                          audience: {
                                            type: 'string',
                                          },
                                          expirationSeconds: {
                                            format: 'int64',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            quobyte: {
                              properties: {
                                group: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                registry: {
                                  type: 'string',
                                },
                                tenant: {
                                  type: 'string',
                                },
                                user: {
                                  type: 'string',
                                },
                                volume: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'registry',
                                'volume',
                              ],
                              type: 'object',
                            },
                            rbd: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                image: {
                                  type: 'string',
                                },
                                keyring: {
                                  type: 'string',
                                },
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                pool: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'image',
                                'monitors',
                              ],
                              type: 'object',
                            },
                            scaleIO: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                gateway: {
                                  type: 'string',
                                },
                                protectionDomain: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                sslEnabled: {
                                  type: 'boolean',
                                },
                                storageMode: {
                                  type: 'string',
                                },
                                storagePool: {
                                  type: 'string',
                                },
                                system: {
                                  type: 'string',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'gateway',
                                'secretRef',
                                'system',
                              ],
                              type: 'object',
                            },
                            secret: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            storageos: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                                volumeNamespace: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            vsphereVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                storagePolicyID: {
                                  type: 'string',
                                },
                                storagePolicyName: {
                                  type: 'string',
                                },
                                volumePath: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumePath',
                              ],
                              type: 'object',
                            },
                          },
                          required: [
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                    },
                    type: 'object',
                  },
                  ingester: {
                    properties: {
                      affinity: {
                        properties: {
                          nodeAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    preference: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'preference',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                properties: {
                                  nodeSelectorTerms: {
                                    items: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                },
                                required: [
                                  'nodeSelectorTerms',
                                ],
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          podAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                            },
                            type: 'object',
                          },
                          podAntiAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
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
                      annotations: {
                        additionalProperties: {
                          type: 'string',
                        },
                        nullable: true,
                        type: 'object',
                      },
                      autoscale: {
                        type: 'boolean',
                      },
                      config: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                      image: {
                        type: 'string',
                      },
                      labels: {
                        additionalProperties: {
                          type: 'string',
                        },
                        type: 'object',
                      },
                      maxReplicas: {
                        format: 'int32',
                        type: 'integer',
                      },
                      minReplicas: {
                        format: 'int32',
                        type: 'integer',
                      },
                      options: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                      replicas: {
                        format: 'int32',
                        type: 'integer',
                      },
                      resources: {
                        nullable: true,
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
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      securityContext: {
                        properties: {
                          fsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          fsGroupChangePolicy: {
                            type: 'string',
                          },
                          runAsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          runAsNonRoot: {
                            type: 'boolean',
                          },
                          runAsUser: {
                            format: 'int64',
                            type: 'integer',
                          },
                          seLinuxOptions: {
                            properties: {
                              level: {
                                type: 'string',
                              },
                              role: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                              user: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          seccompProfile: {
                            properties: {
                              localhostProfile: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                            },
                            required: [
                              'type',
                            ],
                            type: 'object',
                          },
                          supplementalGroups: {
                            items: {
                              format: 'int64',
                              type: 'integer',
                            },
                            type: 'array',
                          },
                          sysctls: {
                            items: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                                value: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'name',
                                'value',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          windowsOptions: {
                            properties: {
                              gmsaCredentialSpec: {
                                type: 'string',
                              },
                              gmsaCredentialSpecName: {
                                type: 'string',
                              },
                              runAsUserName: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      serviceAccount: {
                        type: 'string',
                      },
                      strategy: {
                        properties: {
                          rollingUpdate: {
                            properties: {
                              maxSurge: {
                                anyOf: [
                                  {
                                    type: 'integer',
                                  },
                                  {
                                    type: 'string',
                                  },
                                ],
                                'x-kubernetes-int-or-string': true,
                              },
                              maxUnavailable: {
                                anyOf: [
                                  {
                                    type: 'integer',
                                  },
                                  {
                                    type: 'string',
                                  },
                                ],
                                'x-kubernetes-int-or-string': true,
                              },
                            },
                            type: 'object',
                          },
                          type: {
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      tolerations: {
                        items: {
                          properties: {
                            effect: {
                              type: 'string',
                            },
                            key: {
                              type: 'string',
                            },
                            operator: {
                              type: 'string',
                            },
                            tolerationSeconds: {
                              format: 'int64',
                              type: 'integer',
                            },
                            value: {
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      volumeMounts: {
                        items: {
                          properties: {
                            mountPath: {
                              type: 'string',
                            },
                            mountPropagation: {
                              type: 'string',
                            },
                            name: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            subPath: {
                              type: 'string',
                            },
                            subPathExpr: {
                              type: 'string',
                            },
                          },
                          required: [
                            'mountPath',
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      volumes: {
                        items: {
                          properties: {
                            awsElasticBlockStore: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            azureDisk: {
                              properties: {
                                cachingMode: {
                                  type: 'string',
                                },
                                diskName: {
                                  type: 'string',
                                },
                                diskURI: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                kind: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'diskName',
                                'diskURI',
                              ],
                              type: 'object',
                            },
                            azureFile: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                                shareName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'secretName',
                                'shareName',
                              ],
                              type: 'object',
                            },
                            cephfs: {
                              properties: {
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretFile: {
                                  type: 'string',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'monitors',
                              ],
                              type: 'object',
                            },
                            cinder: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            configMap: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                name: {
                                  type: 'string',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                              },
                              type: 'object',
                            },
                            csi: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                nodePublishSecretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeAttributes: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            downwardAPI: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      fieldRef: {
                                        properties: {
                                          apiVersion: {
                                            type: 'string',
                                          },
                                          fieldPath: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'fieldPath',
                                        ],
                                        type: 'object',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                      resourceFieldRef: {
                                        properties: {
                                          containerName: {
                                            type: 'string',
                                          },
                                          divisor: {
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
                                          resource: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'resource',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    required: [
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            emptyDir: {
                              properties: {
                                medium: {
                                  type: 'string',
                                },
                                sizeLimit: {
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
                              },
                              type: 'object',
                            },
                            ephemeral: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeClaimTemplate: {
                                  properties: {
                                    metadata: {
                                      type: 'object',
                                    },
                                    spec: {
                                      properties: {
                                        accessModes: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        dataSource: {
                                          properties: {
                                            apiGroup: {
                                              type: 'string',
                                            },
                                            kind: {
                                              type: 'string',
                                            },
                                            name: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        selector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        storageClassName: {
                                          type: 'string',
                                        },
                                        volumeMode: {
                                          type: 'string',
                                        },
                                        volumeName: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'spec',
                                  ],
                                  type: 'object',
                                },
                              },
                              type: 'object',
                            },
                            fc: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                targetWWNs: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                wwids: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            flexVolume: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                options: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            flocker: {
                              properties: {
                                datasetName: {
                                  type: 'string',
                                },
                                datasetUUID: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            gcePersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                pdName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'pdName',
                              ],
                              type: 'object',
                            },
                            gitRepo: {
                              properties: {
                                directory: {
                                  type: 'string',
                                },
                                repository: {
                                  type: 'string',
                                },
                                revision: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'repository',
                              ],
                              type: 'object',
                            },
                            glusterfs: {
                              properties: {
                                endpoints: {
                                  type: 'string',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'endpoints',
                                'path',
                              ],
                              type: 'object',
                            },
                            hostPath: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                type: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                              ],
                              type: 'object',
                            },
                            iscsi: {
                              properties: {
                                chapAuthDiscovery: {
                                  type: 'boolean',
                                },
                                chapAuthSession: {
                                  type: 'boolean',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                initiatorName: {
                                  type: 'string',
                                },
                                iqn: {
                                  type: 'string',
                                },
                                iscsiInterface: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                portals: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                targetPortal: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'iqn',
                                'lun',
                                'targetPortal',
                              ],
                              type: 'object',
                            },
                            name: {
                              type: 'string',
                            },
                            nfs: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                server: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                                'server',
                              ],
                              type: 'object',
                            },
                            persistentVolumeClaim: {
                              properties: {
                                claimName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'claimName',
                              ],
                              type: 'object',
                            },
                            photonPersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                pdID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'pdID',
                              ],
                              type: 'object',
                            },
                            portworxVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            projected: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                sources: {
                                  items: {
                                    properties: {
                                      configMap: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      downwardAPI: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                fieldRef: {
                                                  properties: {
                                                    apiVersion: {
                                                      type: 'string',
                                                    },
                                                    fieldPath: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'fieldPath',
                                                  ],
                                                  type: 'object',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                                resourceFieldRef: {
                                                  properties: {
                                                    containerName: {
                                                      type: 'string',
                                                    },
                                                    divisor: {
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
                                                    resource: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'resource',
                                                  ],
                                                  type: 'object',
                                                },
                                              },
                                              required: [
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      secret: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      serviceAccountToken: {
                                        properties: {
                                          audience: {
                                            type: 'string',
                                          },
                                          expirationSeconds: {
                                            format: 'int64',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            quobyte: {
                              properties: {
                                group: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                registry: {
                                  type: 'string',
                                },
                                tenant: {
                                  type: 'string',
                                },
                                user: {
                                  type: 'string',
                                },
                                volume: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'registry',
                                'volume',
                              ],
                              type: 'object',
                            },
                            rbd: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                image: {
                                  type: 'string',
                                },
                                keyring: {
                                  type: 'string',
                                },
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                pool: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'image',
                                'monitors',
                              ],
                              type: 'object',
                            },
                            scaleIO: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                gateway: {
                                  type: 'string',
                                },
                                protectionDomain: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                sslEnabled: {
                                  type: 'boolean',
                                },
                                storageMode: {
                                  type: 'string',
                                },
                                storagePool: {
                                  type: 'string',
                                },
                                system: {
                                  type: 'string',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'gateway',
                                'secretRef',
                                'system',
                              ],
                              type: 'object',
                            },
                            secret: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            storageos: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                                volumeNamespace: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            vsphereVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                storagePolicyID: {
                                  type: 'string',
                                },
                                storagePolicyName: {
                                  type: 'string',
                                },
                                volumePath: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumePath',
                              ],
                              type: 'object',
                            },
                          },
                          required: [
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                    },
                    type: 'object',
                  },
                  ingress: {
                    properties: {
                      affinity: {
                        properties: {
                          nodeAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    preference: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'preference',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                properties: {
                                  nodeSelectorTerms: {
                                    items: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                },
                                required: [
                                  'nodeSelectorTerms',
                                ],
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          podAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                            },
                            type: 'object',
                          },
                          podAntiAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
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
                      annotations: {
                        additionalProperties: {
                          type: 'string',
                        },
                        nullable: true,
                        type: 'object',
                      },
                      enabled: {
                        type: 'boolean',
                      },
                      hosts: {
                        items: {
                          type: 'string',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      ingressClassName: {
                        type: 'string',
                      },
                      labels: {
                        additionalProperties: {
                          type: 'string',
                        },
                        type: 'object',
                      },
                      openshift: {
                        properties: {
                          delegateUrls: {
                            type: 'string',
                          },
                          htpasswdFile: {
                            type: 'string',
                          },
                          sar: {
                            type: 'string',
                          },
                          skipLogout: {
                            type: 'boolean',
                          },
                        },
                        type: 'object',
                      },
                      options: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                      resources: {
                        nullable: true,
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
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      secretName: {
                        type: 'string',
                      },
                      security: {
                        type: 'string',
                      },
                      securityContext: {
                        properties: {
                          fsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          fsGroupChangePolicy: {
                            type: 'string',
                          },
                          runAsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          runAsNonRoot: {
                            type: 'boolean',
                          },
                          runAsUser: {
                            format: 'int64',
                            type: 'integer',
                          },
                          seLinuxOptions: {
                            properties: {
                              level: {
                                type: 'string',
                              },
                              role: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                              user: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          seccompProfile: {
                            properties: {
                              localhostProfile: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                            },
                            required: [
                              'type',
                            ],
                            type: 'object',
                          },
                          supplementalGroups: {
                            items: {
                              format: 'int64',
                              type: 'integer',
                            },
                            type: 'array',
                          },
                          sysctls: {
                            items: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                                value: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'name',
                                'value',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          windowsOptions: {
                            properties: {
                              gmsaCredentialSpec: {
                                type: 'string',
                              },
                              gmsaCredentialSpecName: {
                                type: 'string',
                              },
                              runAsUserName: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      serviceAccount: {
                        type: 'string',
                      },
                      tls: {
                        items: {
                          properties: {
                            hosts: {
                              items: {
                                type: 'string',
                              },
                              type: 'array',
                              'x-kubernetes-list-type': 'atomic',
                            },
                            secretName: {
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      tolerations: {
                        items: {
                          properties: {
                            effect: {
                              type: 'string',
                            },
                            key: {
                              type: 'string',
                            },
                            operator: {
                              type: 'string',
                            },
                            tolerationSeconds: {
                              format: 'int64',
                              type: 'integer',
                            },
                            value: {
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      volumeMounts: {
                        items: {
                          properties: {
                            mountPath: {
                              type: 'string',
                            },
                            mountPropagation: {
                              type: 'string',
                            },
                            name: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            subPath: {
                              type: 'string',
                            },
                            subPathExpr: {
                              type: 'string',
                            },
                          },
                          required: [
                            'mountPath',
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      volumes: {
                        items: {
                          properties: {
                            awsElasticBlockStore: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            azureDisk: {
                              properties: {
                                cachingMode: {
                                  type: 'string',
                                },
                                diskName: {
                                  type: 'string',
                                },
                                diskURI: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                kind: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'diskName',
                                'diskURI',
                              ],
                              type: 'object',
                            },
                            azureFile: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                                shareName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'secretName',
                                'shareName',
                              ],
                              type: 'object',
                            },
                            cephfs: {
                              properties: {
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretFile: {
                                  type: 'string',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'monitors',
                              ],
                              type: 'object',
                            },
                            cinder: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            configMap: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                name: {
                                  type: 'string',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                              },
                              type: 'object',
                            },
                            csi: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                nodePublishSecretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeAttributes: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            downwardAPI: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      fieldRef: {
                                        properties: {
                                          apiVersion: {
                                            type: 'string',
                                          },
                                          fieldPath: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'fieldPath',
                                        ],
                                        type: 'object',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                      resourceFieldRef: {
                                        properties: {
                                          containerName: {
                                            type: 'string',
                                          },
                                          divisor: {
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
                                          resource: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'resource',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    required: [
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            emptyDir: {
                              properties: {
                                medium: {
                                  type: 'string',
                                },
                                sizeLimit: {
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
                              },
                              type: 'object',
                            },
                            ephemeral: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeClaimTemplate: {
                                  properties: {
                                    metadata: {
                                      type: 'object',
                                    },
                                    spec: {
                                      properties: {
                                        accessModes: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        dataSource: {
                                          properties: {
                                            apiGroup: {
                                              type: 'string',
                                            },
                                            kind: {
                                              type: 'string',
                                            },
                                            name: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        selector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        storageClassName: {
                                          type: 'string',
                                        },
                                        volumeMode: {
                                          type: 'string',
                                        },
                                        volumeName: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'spec',
                                  ],
                                  type: 'object',
                                },
                              },
                              type: 'object',
                            },
                            fc: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                targetWWNs: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                wwids: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            flexVolume: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                options: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            flocker: {
                              properties: {
                                datasetName: {
                                  type: 'string',
                                },
                                datasetUUID: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            gcePersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                pdName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'pdName',
                              ],
                              type: 'object',
                            },
                            gitRepo: {
                              properties: {
                                directory: {
                                  type: 'string',
                                },
                                repository: {
                                  type: 'string',
                                },
                                revision: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'repository',
                              ],
                              type: 'object',
                            },
                            glusterfs: {
                              properties: {
                                endpoints: {
                                  type: 'string',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'endpoints',
                                'path',
                              ],
                              type: 'object',
                            },
                            hostPath: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                type: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                              ],
                              type: 'object',
                            },
                            iscsi: {
                              properties: {
                                chapAuthDiscovery: {
                                  type: 'boolean',
                                },
                                chapAuthSession: {
                                  type: 'boolean',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                initiatorName: {
                                  type: 'string',
                                },
                                iqn: {
                                  type: 'string',
                                },
                                iscsiInterface: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                portals: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                targetPortal: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'iqn',
                                'lun',
                                'targetPortal',
                              ],
                              type: 'object',
                            },
                            name: {
                              type: 'string',
                            },
                            nfs: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                server: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                                'server',
                              ],
                              type: 'object',
                            },
                            persistentVolumeClaim: {
                              properties: {
                                claimName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'claimName',
                              ],
                              type: 'object',
                            },
                            photonPersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                pdID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'pdID',
                              ],
                              type: 'object',
                            },
                            portworxVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            projected: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                sources: {
                                  items: {
                                    properties: {
                                      configMap: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      downwardAPI: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                fieldRef: {
                                                  properties: {
                                                    apiVersion: {
                                                      type: 'string',
                                                    },
                                                    fieldPath: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'fieldPath',
                                                  ],
                                                  type: 'object',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                                resourceFieldRef: {
                                                  properties: {
                                                    containerName: {
                                                      type: 'string',
                                                    },
                                                    divisor: {
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
                                                    resource: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'resource',
                                                  ],
                                                  type: 'object',
                                                },
                                              },
                                              required: [
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      secret: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      serviceAccountToken: {
                                        properties: {
                                          audience: {
                                            type: 'string',
                                          },
                                          expirationSeconds: {
                                            format: 'int64',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            quobyte: {
                              properties: {
                                group: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                registry: {
                                  type: 'string',
                                },
                                tenant: {
                                  type: 'string',
                                },
                                user: {
                                  type: 'string',
                                },
                                volume: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'registry',
                                'volume',
                              ],
                              type: 'object',
                            },
                            rbd: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                image: {
                                  type: 'string',
                                },
                                keyring: {
                                  type: 'string',
                                },
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                pool: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'image',
                                'monitors',
                              ],
                              type: 'object',
                            },
                            scaleIO: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                gateway: {
                                  type: 'string',
                                },
                                protectionDomain: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                sslEnabled: {
                                  type: 'boolean',
                                },
                                storageMode: {
                                  type: 'string',
                                },
                                storagePool: {
                                  type: 'string',
                                },
                                system: {
                                  type: 'string',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'gateway',
                                'secretRef',
                                'system',
                              ],
                              type: 'object',
                            },
                            secret: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            storageos: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                                volumeNamespace: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            vsphereVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                storagePolicyID: {
                                  type: 'string',
                                },
                                storagePolicyName: {
                                  type: 'string',
                                },
                                volumePath: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumePath',
                              ],
                              type: 'object',
                            },
                          },
                          required: [
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                    },
                    type: 'object',
                  },
                  labels: {
                    additionalProperties: {
                      type: 'string',
                    },
                    type: 'object',
                  },
                  query: {
                    properties: {
                      affinity: {
                        properties: {
                          nodeAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    preference: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'preference',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                properties: {
                                  nodeSelectorTerms: {
                                    items: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                        matchFields: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                      },
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                },
                                required: [
                                  'nodeSelectorTerms',
                                ],
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          podAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                            },
                            type: 'object',
                          },
                          podAntiAffinity: {
                            properties: {
                              preferredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    podAffinityTerm: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    weight: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                  },
                                  required: [
                                    'podAffinityTerm',
                                    'weight',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              requiredDuringSchedulingIgnoredDuringExecution: {
                                items: {
                                  properties: {
                                    labelSelector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    namespaces: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    topologyKey: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'topologyKey',
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
                      annotations: {
                        additionalProperties: {
                          type: 'string',
                        },
                        nullable: true,
                        type: 'object',
                      },
                      grpcNodePort: {
                        format: 'int32',
                        type: 'integer',
                      },
                      image: {
                        type: 'string',
                      },
                      labels: {
                        additionalProperties: {
                          type: 'string',
                        },
                        type: 'object',
                      },
                      nodePort: {
                        format: 'int32',
                        type: 'integer',
                      },
                      options: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                      priorityClassName: {
                        type: 'string',
                      },
                      replicas: {
                        format: 'int32',
                        type: 'integer',
                      },
                      resources: {
                        nullable: true,
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
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      securityContext: {
                        properties: {
                          fsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          fsGroupChangePolicy: {
                            type: 'string',
                          },
                          runAsGroup: {
                            format: 'int64',
                            type: 'integer',
                          },
                          runAsNonRoot: {
                            type: 'boolean',
                          },
                          runAsUser: {
                            format: 'int64',
                            type: 'integer',
                          },
                          seLinuxOptions: {
                            properties: {
                              level: {
                                type: 'string',
                              },
                              role: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                              user: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          seccompProfile: {
                            properties: {
                              localhostProfile: {
                                type: 'string',
                              },
                              type: {
                                type: 'string',
                              },
                            },
                            required: [
                              'type',
                            ],
                            type: 'object',
                          },
                          supplementalGroups: {
                            items: {
                              format: 'int64',
                              type: 'integer',
                            },
                            type: 'array',
                          },
                          sysctls: {
                            items: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                                value: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'name',
                                'value',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          windowsOptions: {
                            properties: {
                              gmsaCredentialSpec: {
                                type: 'string',
                              },
                              gmsaCredentialSpecName: {
                                type: 'string',
                              },
                              runAsUserName: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      serviceAccount: {
                        type: 'string',
                      },
                      serviceType: {
                        type: 'string',
                      },
                      strategy: {
                        properties: {
                          rollingUpdate: {
                            properties: {
                              maxSurge: {
                                anyOf: [
                                  {
                                    type: 'integer',
                                  },
                                  {
                                    type: 'string',
                                  },
                                ],
                                'x-kubernetes-int-or-string': true,
                              },
                              maxUnavailable: {
                                anyOf: [
                                  {
                                    type: 'integer',
                                  },
                                  {
                                    type: 'string',
                                  },
                                ],
                                'x-kubernetes-int-or-string': true,
                              },
                            },
                            type: 'object',
                          },
                          type: {
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      tolerations: {
                        items: {
                          properties: {
                            effect: {
                              type: 'string',
                            },
                            key: {
                              type: 'string',
                            },
                            operator: {
                              type: 'string',
                            },
                            tolerationSeconds: {
                              format: 'int64',
                              type: 'integer',
                            },
                            value: {
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      tracingEnabled: {
                        type: 'boolean',
                      },
                      volumeMounts: {
                        items: {
                          properties: {
                            mountPath: {
                              type: 'string',
                            },
                            mountPropagation: {
                              type: 'string',
                            },
                            name: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            subPath: {
                              type: 'string',
                            },
                            subPathExpr: {
                              type: 'string',
                            },
                          },
                          required: [
                            'mountPath',
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                      volumes: {
                        items: {
                          properties: {
                            awsElasticBlockStore: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            azureDisk: {
                              properties: {
                                cachingMode: {
                                  type: 'string',
                                },
                                diskName: {
                                  type: 'string',
                                },
                                diskURI: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                kind: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'diskName',
                                'diskURI',
                              ],
                              type: 'object',
                            },
                            azureFile: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                                shareName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'secretName',
                                'shareName',
                              ],
                              type: 'object',
                            },
                            cephfs: {
                              properties: {
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretFile: {
                                  type: 'string',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'monitors',
                              ],
                              type: 'object',
                            },
                            cinder: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            configMap: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                name: {
                                  type: 'string',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                              },
                              type: 'object',
                            },
                            csi: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                nodePublishSecretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeAttributes: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            downwardAPI: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      fieldRef: {
                                        properties: {
                                          apiVersion: {
                                            type: 'string',
                                          },
                                          fieldPath: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'fieldPath',
                                        ],
                                        type: 'object',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                      resourceFieldRef: {
                                        properties: {
                                          containerName: {
                                            type: 'string',
                                          },
                                          divisor: {
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
                                          resource: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'resource',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    required: [
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            emptyDir: {
                              properties: {
                                medium: {
                                  type: 'string',
                                },
                                sizeLimit: {
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
                              },
                              type: 'object',
                            },
                            ephemeral: {
                              properties: {
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeClaimTemplate: {
                                  properties: {
                                    metadata: {
                                      type: 'object',
                                    },
                                    spec: {
                                      properties: {
                                        accessModes: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        dataSource: {
                                          properties: {
                                            apiGroup: {
                                              type: 'string',
                                            },
                                            kind: {
                                              type: 'string',
                                            },
                                            name: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        selector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        storageClassName: {
                                          type: 'string',
                                        },
                                        volumeMode: {
                                          type: 'string',
                                        },
                                        volumeName: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'spec',
                                  ],
                                  type: 'object',
                                },
                              },
                              type: 'object',
                            },
                            fc: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                targetWWNs: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                wwids: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            flexVolume: {
                              properties: {
                                driver: {
                                  type: 'string',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                options: {
                                  additionalProperties: {
                                    type: 'string',
                                  },
                                  type: 'object',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'driver',
                              ],
                              type: 'object',
                            },
                            flocker: {
                              properties: {
                                datasetName: {
                                  type: 'string',
                                },
                                datasetUUID: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            gcePersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                partition: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                pdName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'pdName',
                              ],
                              type: 'object',
                            },
                            gitRepo: {
                              properties: {
                                directory: {
                                  type: 'string',
                                },
                                repository: {
                                  type: 'string',
                                },
                                revision: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'repository',
                              ],
                              type: 'object',
                            },
                            glusterfs: {
                              properties: {
                                endpoints: {
                                  type: 'string',
                                },
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'endpoints',
                                'path',
                              ],
                              type: 'object',
                            },
                            hostPath: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                type: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                              ],
                              type: 'object',
                            },
                            iscsi: {
                              properties: {
                                chapAuthDiscovery: {
                                  type: 'boolean',
                                },
                                chapAuthSession: {
                                  type: 'boolean',
                                },
                                fsType: {
                                  type: 'string',
                                },
                                initiatorName: {
                                  type: 'string',
                                },
                                iqn: {
                                  type: 'string',
                                },
                                iscsiInterface: {
                                  type: 'string',
                                },
                                lun: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                portals: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                targetPortal: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'iqn',
                                'lun',
                                'targetPortal',
                              ],
                              type: 'object',
                            },
                            name: {
                              type: 'string',
                            },
                            nfs: {
                              properties: {
                                path: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                server: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'path',
                                'server',
                              ],
                              type: 'object',
                            },
                            persistentVolumeClaim: {
                              properties: {
                                claimName: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                              },
                              required: [
                                'claimName',
                              ],
                              type: 'object',
                            },
                            photonPersistentDisk: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                pdID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'pdID',
                              ],
                              type: 'object',
                            },
                            portworxVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                volumeID: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumeID',
                              ],
                              type: 'object',
                            },
                            projected: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                sources: {
                                  items: {
                                    properties: {
                                      configMap: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      downwardAPI: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                fieldRef: {
                                                  properties: {
                                                    apiVersion: {
                                                      type: 'string',
                                                    },
                                                    fieldPath: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'fieldPath',
                                                  ],
                                                  type: 'object',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                                resourceFieldRef: {
                                                  properties: {
                                                    containerName: {
                                                      type: 'string',
                                                    },
                                                    divisor: {
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
                                                    resource: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'resource',
                                                  ],
                                                  type: 'object',
                                                },
                                              },
                                              required: [
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      secret: {
                                        properties: {
                                          items: {
                                            items: {
                                              properties: {
                                                key: {
                                                  type: 'string',
                                                },
                                                mode: {
                                                  format: 'int32',
                                                  type: 'integer',
                                                },
                                                path: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'key',
                                                'path',
                                              ],
                                              type: 'object',
                                            },
                                            type: 'array',
                                          },
                                          name: {
                                            type: 'string',
                                          },
                                          optional: {
                                            type: 'boolean',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      serviceAccountToken: {
                                        properties: {
                                          audience: {
                                            type: 'string',
                                          },
                                          expirationSeconds: {
                                            format: 'int64',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                              },
                              type: 'object',
                            },
                            quobyte: {
                              properties: {
                                group: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                registry: {
                                  type: 'string',
                                },
                                tenant: {
                                  type: 'string',
                                },
                                user: {
                                  type: 'string',
                                },
                                volume: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'registry',
                                'volume',
                              ],
                              type: 'object',
                            },
                            rbd: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                image: {
                                  type: 'string',
                                },
                                keyring: {
                                  type: 'string',
                                },
                                monitors: {
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                                pool: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                user: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'image',
                                'monitors',
                              ],
                              type: 'object',
                            },
                            scaleIO: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                gateway: {
                                  type: 'string',
                                },
                                protectionDomain: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                sslEnabled: {
                                  type: 'boolean',
                                },
                                storageMode: {
                                  type: 'string',
                                },
                                storagePool: {
                                  type: 'string',
                                },
                                system: {
                                  type: 'string',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'gateway',
                                'secretRef',
                                'system',
                              ],
                              type: 'object',
                            },
                            secret: {
                              properties: {
                                defaultMode: {
                                  format: 'int32',
                                  type: 'integer',
                                },
                                items: {
                                  items: {
                                    properties: {
                                      key: {
                                        type: 'string',
                                      },
                                      mode: {
                                        format: 'int32',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'key',
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                  type: 'array',
                                },
                                optional: {
                                  type: 'boolean',
                                },
                                secretName: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            storageos: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                secretRef: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                volumeName: {
                                  type: 'string',
                                },
                                volumeNamespace: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            vsphereVolume: {
                              properties: {
                                fsType: {
                                  type: 'string',
                                },
                                storagePolicyID: {
                                  type: 'string',
                                },
                                storagePolicyName: {
                                  type: 'string',
                                },
                                volumePath: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'volumePath',
                              ],
                              type: 'object',
                            },
                          },
                          required: [
                            'name',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                        'x-kubernetes-list-type': 'atomic',
                      },
                    },
                    type: 'object',
                  },
                  resources: {
                    nullable: true,
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
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  sampling: {
                    properties: {
                      options: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                    },
                    type: 'object',
                  },
                  securityContext: {
                    properties: {
                      fsGroup: {
                        format: 'int64',
                        type: 'integer',
                      },
                      fsGroupChangePolicy: {
                        type: 'string',
                      },
                      runAsGroup: {
                        format: 'int64',
                        type: 'integer',
                      },
                      runAsNonRoot: {
                        type: 'boolean',
                      },
                      runAsUser: {
                        format: 'int64',
                        type: 'integer',
                      },
                      seLinuxOptions: {
                        properties: {
                          level: {
                            type: 'string',
                          },
                          role: {
                            type: 'string',
                          },
                          type: {
                            type: 'string',
                          },
                          user: {
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      seccompProfile: {
                        properties: {
                          localhostProfile: {
                            type: 'string',
                          },
                          type: {
                            type: 'string',
                          },
                        },
                        required: [
                          'type',
                        ],
                        type: 'object',
                      },
                      supplementalGroups: {
                        items: {
                          format: 'int64',
                          type: 'integer',
                        },
                        type: 'array',
                      },
                      sysctls: {
                        items: {
                          properties: {
                            name: {
                              type: 'string',
                            },
                            value: {
                              type: 'string',
                            },
                          },
                          required: [
                            'name',
                            'value',
                          ],
                          type: 'object',
                        },
                        type: 'array',
                      },
                      windowsOptions: {
                        properties: {
                          gmsaCredentialSpec: {
                            type: 'string',
                          },
                          gmsaCredentialSpecName: {
                            type: 'string',
                          },
                          runAsUserName: {
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  serviceAccount: {
                    type: 'string',
                  },
                  storage: {
                    properties: {
                      cassandraCreateSchema: {
                        properties: {
                          affinity: {
                            properties: {
                              nodeAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        preference: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                            matchFields: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                          },
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'preference',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    properties: {
                                      nodeSelectorTerms: {
                                        items: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                            matchFields: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                          },
                                          type: 'object',
                                        },
                                        type: 'array',
                                      },
                                    },
                                    required: [
                                      'nodeSelectorTerms',
                                    ],
                                    type: 'object',
                                  },
                                },
                                type: 'object',
                              },
                              podAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        podAffinityTerm: {
                                          properties: {
                                            labelSelector: {
                                              properties: {
                                                matchExpressions: {
                                                  items: {
                                                    properties: {
                                                      key: {
                                                        type: 'string',
                                                      },
                                                      operator: {
                                                        type: 'string',
                                                      },
                                                      values: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            namespaces: {
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                            topologyKey: {
                                              type: 'string',
                                            },
                                          },
                                          required: [
                                            'topologyKey',
                                          ],
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'podAffinityTerm',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                },
                                type: 'object',
                              },
                              podAntiAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        podAffinityTerm: {
                                          properties: {
                                            labelSelector: {
                                              properties: {
                                                matchExpressions: {
                                                  items: {
                                                    properties: {
                                                      key: {
                                                        type: 'string',
                                                      },
                                                      operator: {
                                                        type: 'string',
                                                      },
                                                      values: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            namespaces: {
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                            topologyKey: {
                                              type: 'string',
                                            },
                                          },
                                          required: [
                                            'topologyKey',
                                          ],
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'podAffinityTerm',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
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
                          datacenter: {
                            type: 'string',
                          },
                          enabled: {
                            type: 'boolean',
                          },
                          image: {
                            type: 'string',
                          },
                          mode: {
                            type: 'string',
                          },
                          timeout: {
                            type: 'string',
                          },
                          traceTTL: {
                            type: 'string',
                          },
                          ttlSecondsAfterFinished: {
                            format: 'int32',
                            type: 'integer',
                          },
                        },
                        type: 'object',
                      },
                      dependencies: {
                        properties: {
                          affinity: {
                            properties: {
                              nodeAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        preference: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                            matchFields: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                          },
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'preference',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    properties: {
                                      nodeSelectorTerms: {
                                        items: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                            matchFields: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                          },
                                          type: 'object',
                                        },
                                        type: 'array',
                                      },
                                    },
                                    required: [
                                      'nodeSelectorTerms',
                                    ],
                                    type: 'object',
                                  },
                                },
                                type: 'object',
                              },
                              podAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        podAffinityTerm: {
                                          properties: {
                                            labelSelector: {
                                              properties: {
                                                matchExpressions: {
                                                  items: {
                                                    properties: {
                                                      key: {
                                                        type: 'string',
                                                      },
                                                      operator: {
                                                        type: 'string',
                                                      },
                                                      values: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            namespaces: {
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                            topologyKey: {
                                              type: 'string',
                                            },
                                          },
                                          required: [
                                            'topologyKey',
                                          ],
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'podAffinityTerm',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                },
                                type: 'object',
                              },
                              podAntiAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        podAffinityTerm: {
                                          properties: {
                                            labelSelector: {
                                              properties: {
                                                matchExpressions: {
                                                  items: {
                                                    properties: {
                                                      key: {
                                                        type: 'string',
                                                      },
                                                      operator: {
                                                        type: 'string',
                                                      },
                                                      values: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            namespaces: {
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                            topologyKey: {
                                              type: 'string',
                                            },
                                          },
                                          required: [
                                            'topologyKey',
                                          ],
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'podAffinityTerm',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
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
                          annotations: {
                            additionalProperties: {
                              type: 'string',
                            },
                            nullable: true,
                            type: 'object',
                          },
                          backoffLimit: {
                            format: 'int32',
                            type: 'integer',
                          },
                          cassandraClientAuthEnabled: {
                            type: 'boolean',
                          },
                          elasticsearchClientNodeOnly: {
                            type: 'boolean',
                          },
                          elasticsearchNodesWanOnly: {
                            type: 'boolean',
                          },
                          elasticsearchTimeRange: {
                            type: 'string',
                          },
                          enabled: {
                            type: 'boolean',
                          },
                          image: {
                            type: 'string',
                          },
                          javaOpts: {
                            type: 'string',
                          },
                          labels: {
                            additionalProperties: {
                              type: 'string',
                            },
                            type: 'object',
                          },
                          resources: {
                            nullable: true,
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
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          schedule: {
                            type: 'string',
                          },
                          securityContext: {
                            properties: {
                              fsGroup: {
                                format: 'int64',
                                type: 'integer',
                              },
                              fsGroupChangePolicy: {
                                type: 'string',
                              },
                              runAsGroup: {
                                format: 'int64',
                                type: 'integer',
                              },
                              runAsNonRoot: {
                                type: 'boolean',
                              },
                              runAsUser: {
                                format: 'int64',
                                type: 'integer',
                              },
                              seLinuxOptions: {
                                properties: {
                                  level: {
                                    type: 'string',
                                  },
                                  role: {
                                    type: 'string',
                                  },
                                  type: {
                                    type: 'string',
                                  },
                                  user: {
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              seccompProfile: {
                                properties: {
                                  localhostProfile: {
                                    type: 'string',
                                  },
                                  type: {
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'type',
                                ],
                                type: 'object',
                              },
                              supplementalGroups: {
                                items: {
                                  format: 'int64',
                                  type: 'integer',
                                },
                                type: 'array',
                              },
                              sysctls: {
                                items: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                    value: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'name',
                                    'value',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              windowsOptions: {
                                properties: {
                                  gmsaCredentialSpec: {
                                    type: 'string',
                                  },
                                  gmsaCredentialSpecName: {
                                    type: 'string',
                                  },
                                  runAsUserName: {
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          serviceAccount: {
                            type: 'string',
                          },
                          sparkMaster: {
                            type: 'string',
                          },
                          successfulJobsHistoryLimit: {
                            format: 'int32',
                            type: 'integer',
                          },
                          tolerations: {
                            items: {
                              properties: {
                                effect: {
                                  type: 'string',
                                },
                                key: {
                                  type: 'string',
                                },
                                operator: {
                                  type: 'string',
                                },
                                tolerationSeconds: {
                                  format: 'int64',
                                  type: 'integer',
                                },
                                value: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            type: 'array',
                            'x-kubernetes-list-type': 'atomic',
                          },
                          ttlSecondsAfterFinished: {
                            format: 'int32',
                            type: 'integer',
                          },
                          volumeMounts: {
                            items: {
                              properties: {
                                mountPath: {
                                  type: 'string',
                                },
                                mountPropagation: {
                                  type: 'string',
                                },
                                name: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                subPath: {
                                  type: 'string',
                                },
                                subPathExpr: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'mountPath',
                                'name',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                            'x-kubernetes-list-type': 'atomic',
                          },
                          volumes: {
                            items: {
                              properties: {
                                awsElasticBlockStore: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    partition: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumeID',
                                  ],
                                  type: 'object',
                                },
                                azureDisk: {
                                  properties: {
                                    cachingMode: {
                                      type: 'string',
                                    },
                                    diskName: {
                                      type: 'string',
                                    },
                                    diskURI: {
                                      type: 'string',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    kind: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'diskName',
                                    'diskURI',
                                  ],
                                  type: 'object',
                                },
                                azureFile: {
                                  properties: {
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretName: {
                                      type: 'string',
                                    },
                                    shareName: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'secretName',
                                    'shareName',
                                  ],
                                  type: 'object',
                                },
                                cephfs: {
                                  properties: {
                                    monitors: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    path: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretFile: {
                                      type: 'string',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    user: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'monitors',
                                  ],
                                  type: 'object',
                                },
                                cinder: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    volumeID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumeID',
                                  ],
                                  type: 'object',
                                },
                                configMap: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    items: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          mode: {
                                            format: 'int32',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'key',
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                    name: {
                                      type: 'string',
                                    },
                                    optional: {
                                      type: 'boolean',
                                    },
                                  },
                                  type: 'object',
                                },
                                csi: {
                                  properties: {
                                    driver: {
                                      type: 'string',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    nodePublishSecretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeAttributes: {
                                      additionalProperties: {
                                        type: 'string',
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'driver',
                                  ],
                                  type: 'object',
                                },
                                downwardAPI: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    items: {
                                      items: {
                                        properties: {
                                          fieldRef: {
                                            properties: {
                                              apiVersion: {
                                                type: 'string',
                                              },
                                              fieldPath: {
                                                type: 'string',
                                              },
                                            },
                                            required: [
                                              'fieldPath',
                                            ],
                                            type: 'object',
                                          },
                                          mode: {
                                            format: 'int32',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                          resourceFieldRef: {
                                            properties: {
                                              containerName: {
                                                type: 'string',
                                              },
                                              divisor: {
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
                                              resource: {
                                                type: 'string',
                                              },
                                            },
                                            required: [
                                              'resource',
                                            ],
                                            type: 'object',
                                          },
                                        },
                                        required: [
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                  },
                                  type: 'object',
                                },
                                emptyDir: {
                                  properties: {
                                    medium: {
                                      type: 'string',
                                    },
                                    sizeLimit: {
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
                                  },
                                  type: 'object',
                                },
                                ephemeral: {
                                  properties: {
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeClaimTemplate: {
                                      properties: {
                                        metadata: {
                                          type: 'object',
                                        },
                                        spec: {
                                          properties: {
                                            accessModes: {
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                            dataSource: {
                                              properties: {
                                                apiGroup: {
                                                  type: 'string',
                                                },
                                                kind: {
                                                  type: 'string',
                                                },
                                                name: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            selector: {
                                              properties: {
                                                matchExpressions: {
                                                  items: {
                                                    properties: {
                                                      key: {
                                                        type: 'string',
                                                      },
                                                      operator: {
                                                        type: 'string',
                                                      },
                                                      values: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            storageClassName: {
                                              type: 'string',
                                            },
                                            volumeMode: {
                                              type: 'string',
                                            },
                                            volumeName: {
                                              type: 'string',
                                            },
                                          },
                                          type: 'object',
                                        },
                                      },
                                      required: [
                                        'spec',
                                      ],
                                      type: 'object',
                                    },
                                  },
                                  type: 'object',
                                },
                                fc: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    lun: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    targetWWNs: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    wwids: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                  },
                                  type: 'object',
                                },
                                flexVolume: {
                                  properties: {
                                    driver: {
                                      type: 'string',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    options: {
                                      additionalProperties: {
                                        type: 'string',
                                      },
                                      type: 'object',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'driver',
                                  ],
                                  type: 'object',
                                },
                                flocker: {
                                  properties: {
                                    datasetName: {
                                      type: 'string',
                                    },
                                    datasetUUID: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                gcePersistentDisk: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    partition: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    pdName: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'pdName',
                                  ],
                                  type: 'object',
                                },
                                gitRepo: {
                                  properties: {
                                    directory: {
                                      type: 'string',
                                    },
                                    repository: {
                                      type: 'string',
                                    },
                                    revision: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'repository',
                                  ],
                                  type: 'object',
                                },
                                glusterfs: {
                                  properties: {
                                    endpoints: {
                                      type: 'string',
                                    },
                                    path: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'endpoints',
                                    'path',
                                  ],
                                  type: 'object',
                                },
                                hostPath: {
                                  properties: {
                                    path: {
                                      type: 'string',
                                    },
                                    type: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'path',
                                  ],
                                  type: 'object',
                                },
                                iscsi: {
                                  properties: {
                                    chapAuthDiscovery: {
                                      type: 'boolean',
                                    },
                                    chapAuthSession: {
                                      type: 'boolean',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    initiatorName: {
                                      type: 'string',
                                    },
                                    iqn: {
                                      type: 'string',
                                    },
                                    iscsiInterface: {
                                      type: 'string',
                                    },
                                    lun: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    portals: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    targetPortal: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'iqn',
                                    'lun',
                                    'targetPortal',
                                  ],
                                  type: 'object',
                                },
                                name: {
                                  type: 'string',
                                },
                                nfs: {
                                  properties: {
                                    path: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    server: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'path',
                                    'server',
                                  ],
                                  type: 'object',
                                },
                                persistentVolumeClaim: {
                                  properties: {
                                    claimName: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'claimName',
                                  ],
                                  type: 'object',
                                },
                                photonPersistentDisk: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    pdID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'pdID',
                                  ],
                                  type: 'object',
                                },
                                portworxVolume: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumeID',
                                  ],
                                  type: 'object',
                                },
                                projected: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    sources: {
                                      items: {
                                        properties: {
                                          configMap: {
                                            properties: {
                                              items: {
                                                items: {
                                                  properties: {
                                                    key: {
                                                      type: 'string',
                                                    },
                                                    mode: {
                                                      format: 'int32',
                                                      type: 'integer',
                                                    },
                                                    path: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'key',
                                                    'path',
                                                  ],
                                                  type: 'object',
                                                },
                                                type: 'array',
                                              },
                                              name: {
                                                type: 'string',
                                              },
                                              optional: {
                                                type: 'boolean',
                                              },
                                            },
                                            type: 'object',
                                          },
                                          downwardAPI: {
                                            properties: {
                                              items: {
                                                items: {
                                                  properties: {
                                                    fieldRef: {
                                                      properties: {
                                                        apiVersion: {
                                                          type: 'string',
                                                        },
                                                        fieldPath: {
                                                          type: 'string',
                                                        },
                                                      },
                                                      required: [
                                                        'fieldPath',
                                                      ],
                                                      type: 'object',
                                                    },
                                                    mode: {
                                                      format: 'int32',
                                                      type: 'integer',
                                                    },
                                                    path: {
                                                      type: 'string',
                                                    },
                                                    resourceFieldRef: {
                                                      properties: {
                                                        containerName: {
                                                          type: 'string',
                                                        },
                                                        divisor: {
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
                                                        resource: {
                                                          type: 'string',
                                                        },
                                                      },
                                                      required: [
                                                        'resource',
                                                      ],
                                                      type: 'object',
                                                    },
                                                  },
                                                  required: [
                                                    'path',
                                                  ],
                                                  type: 'object',
                                                },
                                                type: 'array',
                                              },
                                            },
                                            type: 'object',
                                          },
                                          secret: {
                                            properties: {
                                              items: {
                                                items: {
                                                  properties: {
                                                    key: {
                                                      type: 'string',
                                                    },
                                                    mode: {
                                                      format: 'int32',
                                                      type: 'integer',
                                                    },
                                                    path: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'key',
                                                    'path',
                                                  ],
                                                  type: 'object',
                                                },
                                                type: 'array',
                                              },
                                              name: {
                                                type: 'string',
                                              },
                                              optional: {
                                                type: 'boolean',
                                              },
                                            },
                                            type: 'object',
                                          },
                                          serviceAccountToken: {
                                            properties: {
                                              audience: {
                                                type: 'string',
                                              },
                                              expirationSeconds: {
                                                format: 'int64',
                                                type: 'integer',
                                              },
                                              path: {
                                                type: 'string',
                                              },
                                            },
                                            required: [
                                              'path',
                                            ],
                                            type: 'object',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                  },
                                  type: 'object',
                                },
                                quobyte: {
                                  properties: {
                                    group: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    registry: {
                                      type: 'string',
                                    },
                                    tenant: {
                                      type: 'string',
                                    },
                                    user: {
                                      type: 'string',
                                    },
                                    volume: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'registry',
                                    'volume',
                                  ],
                                  type: 'object',
                                },
                                rbd: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    image: {
                                      type: 'string',
                                    },
                                    keyring: {
                                      type: 'string',
                                    },
                                    monitors: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    pool: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    user: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'image',
                                    'monitors',
                                  ],
                                  type: 'object',
                                },
                                scaleIO: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    gateway: {
                                      type: 'string',
                                    },
                                    protectionDomain: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    sslEnabled: {
                                      type: 'boolean',
                                    },
                                    storageMode: {
                                      type: 'string',
                                    },
                                    storagePool: {
                                      type: 'string',
                                    },
                                    system: {
                                      type: 'string',
                                    },
                                    volumeName: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'gateway',
                                    'secretRef',
                                    'system',
                                  ],
                                  type: 'object',
                                },
                                secret: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    items: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          mode: {
                                            format: 'int32',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'key',
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                    optional: {
                                      type: 'boolean',
                                    },
                                    secretName: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                storageos: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    volumeName: {
                                      type: 'string',
                                    },
                                    volumeNamespace: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                vsphereVolume: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    storagePolicyID: {
                                      type: 'string',
                                    },
                                    storagePolicyName: {
                                      type: 'string',
                                    },
                                    volumePath: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumePath',
                                  ],
                                  type: 'object',
                                },
                              },
                              required: [
                                'name',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                            'x-kubernetes-list-type': 'atomic',
                          },
                        },
                        type: 'object',
                      },
                      elasticsearch: {
                        properties: {
                          image: {
                            type: 'string',
                          },
                          nodeCount: {
                            format: 'int32',
                            type: 'integer',
                          },
                          nodeSelector: {
                            additionalProperties: {
                              type: 'string',
                            },
                            type: 'object',
                          },
                          redundancyPolicy: {
                            type: 'string',
                          },
                          resources: {
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
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          storage: {
                            properties: {
                              size: {
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
                              storageClassName: {
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          tolerations: {
                            items: {
                              properties: {
                                effect: {
                                  type: 'string',
                                },
                                key: {
                                  type: 'string',
                                },
                                operator: {
                                  type: 'string',
                                },
                                tolerationSeconds: {
                                  format: 'int64',
                                  type: 'integer',
                                },
                                value: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            type: 'array',
                            'x-kubernetes-list-type': 'atomic',
                          },
                        },
                        type: 'object',
                      },
                      esIndexCleaner: {
                        properties: {
                          affinity: {
                            properties: {
                              nodeAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        preference: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                            matchFields: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                          },
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'preference',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    properties: {
                                      nodeSelectorTerms: {
                                        items: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                            matchFields: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                          },
                                          type: 'object',
                                        },
                                        type: 'array',
                                      },
                                    },
                                    required: [
                                      'nodeSelectorTerms',
                                    ],
                                    type: 'object',
                                  },
                                },
                                type: 'object',
                              },
                              podAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        podAffinityTerm: {
                                          properties: {
                                            labelSelector: {
                                              properties: {
                                                matchExpressions: {
                                                  items: {
                                                    properties: {
                                                      key: {
                                                        type: 'string',
                                                      },
                                                      operator: {
                                                        type: 'string',
                                                      },
                                                      values: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            namespaces: {
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                            topologyKey: {
                                              type: 'string',
                                            },
                                          },
                                          required: [
                                            'topologyKey',
                                          ],
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'podAffinityTerm',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                },
                                type: 'object',
                              },
                              podAntiAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        podAffinityTerm: {
                                          properties: {
                                            labelSelector: {
                                              properties: {
                                                matchExpressions: {
                                                  items: {
                                                    properties: {
                                                      key: {
                                                        type: 'string',
                                                      },
                                                      operator: {
                                                        type: 'string',
                                                      },
                                                      values: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            namespaces: {
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                            topologyKey: {
                                              type: 'string',
                                            },
                                          },
                                          required: [
                                            'topologyKey',
                                          ],
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'podAffinityTerm',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
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
                          annotations: {
                            additionalProperties: {
                              type: 'string',
                            },
                            nullable: true,
                            type: 'object',
                          },
                          backoffLimit: {
                            format: 'int32',
                            type: 'integer',
                          },
                          enabled: {
                            type: 'boolean',
                          },
                          image: {
                            type: 'string',
                          },
                          labels: {
                            additionalProperties: {
                              type: 'string',
                            },
                            type: 'object',
                          },
                          numberOfDays: {
                            type: 'integer',
                          },
                          resources: {
                            nullable: true,
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
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          schedule: {
                            type: 'string',
                          },
                          securityContext: {
                            properties: {
                              fsGroup: {
                                format: 'int64',
                                type: 'integer',
                              },
                              fsGroupChangePolicy: {
                                type: 'string',
                              },
                              runAsGroup: {
                                format: 'int64',
                                type: 'integer',
                              },
                              runAsNonRoot: {
                                type: 'boolean',
                              },
                              runAsUser: {
                                format: 'int64',
                                type: 'integer',
                              },
                              seLinuxOptions: {
                                properties: {
                                  level: {
                                    type: 'string',
                                  },
                                  role: {
                                    type: 'string',
                                  },
                                  type: {
                                    type: 'string',
                                  },
                                  user: {
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              seccompProfile: {
                                properties: {
                                  localhostProfile: {
                                    type: 'string',
                                  },
                                  type: {
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'type',
                                ],
                                type: 'object',
                              },
                              supplementalGroups: {
                                items: {
                                  format: 'int64',
                                  type: 'integer',
                                },
                                type: 'array',
                              },
                              sysctls: {
                                items: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                    value: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'name',
                                    'value',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              windowsOptions: {
                                properties: {
                                  gmsaCredentialSpec: {
                                    type: 'string',
                                  },
                                  gmsaCredentialSpecName: {
                                    type: 'string',
                                  },
                                  runAsUserName: {
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          serviceAccount: {
                            type: 'string',
                          },
                          successfulJobsHistoryLimit: {
                            format: 'int32',
                            type: 'integer',
                          },
                          tolerations: {
                            items: {
                              properties: {
                                effect: {
                                  type: 'string',
                                },
                                key: {
                                  type: 'string',
                                },
                                operator: {
                                  type: 'string',
                                },
                                tolerationSeconds: {
                                  format: 'int64',
                                  type: 'integer',
                                },
                                value: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            type: 'array',
                            'x-kubernetes-list-type': 'atomic',
                          },
                          ttlSecondsAfterFinished: {
                            format: 'int32',
                            type: 'integer',
                          },
                          volumeMounts: {
                            items: {
                              properties: {
                                mountPath: {
                                  type: 'string',
                                },
                                mountPropagation: {
                                  type: 'string',
                                },
                                name: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                subPath: {
                                  type: 'string',
                                },
                                subPathExpr: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'mountPath',
                                'name',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                            'x-kubernetes-list-type': 'atomic',
                          },
                          volumes: {
                            items: {
                              properties: {
                                awsElasticBlockStore: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    partition: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumeID',
                                  ],
                                  type: 'object',
                                },
                                azureDisk: {
                                  properties: {
                                    cachingMode: {
                                      type: 'string',
                                    },
                                    diskName: {
                                      type: 'string',
                                    },
                                    diskURI: {
                                      type: 'string',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    kind: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'diskName',
                                    'diskURI',
                                  ],
                                  type: 'object',
                                },
                                azureFile: {
                                  properties: {
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretName: {
                                      type: 'string',
                                    },
                                    shareName: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'secretName',
                                    'shareName',
                                  ],
                                  type: 'object',
                                },
                                cephfs: {
                                  properties: {
                                    monitors: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    path: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretFile: {
                                      type: 'string',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    user: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'monitors',
                                  ],
                                  type: 'object',
                                },
                                cinder: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    volumeID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumeID',
                                  ],
                                  type: 'object',
                                },
                                configMap: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    items: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          mode: {
                                            format: 'int32',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'key',
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                    name: {
                                      type: 'string',
                                    },
                                    optional: {
                                      type: 'boolean',
                                    },
                                  },
                                  type: 'object',
                                },
                                csi: {
                                  properties: {
                                    driver: {
                                      type: 'string',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    nodePublishSecretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeAttributes: {
                                      additionalProperties: {
                                        type: 'string',
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'driver',
                                  ],
                                  type: 'object',
                                },
                                downwardAPI: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    items: {
                                      items: {
                                        properties: {
                                          fieldRef: {
                                            properties: {
                                              apiVersion: {
                                                type: 'string',
                                              },
                                              fieldPath: {
                                                type: 'string',
                                              },
                                            },
                                            required: [
                                              'fieldPath',
                                            ],
                                            type: 'object',
                                          },
                                          mode: {
                                            format: 'int32',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                          resourceFieldRef: {
                                            properties: {
                                              containerName: {
                                                type: 'string',
                                              },
                                              divisor: {
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
                                              resource: {
                                                type: 'string',
                                              },
                                            },
                                            required: [
                                              'resource',
                                            ],
                                            type: 'object',
                                          },
                                        },
                                        required: [
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                  },
                                  type: 'object',
                                },
                                emptyDir: {
                                  properties: {
                                    medium: {
                                      type: 'string',
                                    },
                                    sizeLimit: {
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
                                  },
                                  type: 'object',
                                },
                                ephemeral: {
                                  properties: {
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeClaimTemplate: {
                                      properties: {
                                        metadata: {
                                          type: 'object',
                                        },
                                        spec: {
                                          properties: {
                                            accessModes: {
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                            dataSource: {
                                              properties: {
                                                apiGroup: {
                                                  type: 'string',
                                                },
                                                kind: {
                                                  type: 'string',
                                                },
                                                name: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            selector: {
                                              properties: {
                                                matchExpressions: {
                                                  items: {
                                                    properties: {
                                                      key: {
                                                        type: 'string',
                                                      },
                                                      operator: {
                                                        type: 'string',
                                                      },
                                                      values: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            storageClassName: {
                                              type: 'string',
                                            },
                                            volumeMode: {
                                              type: 'string',
                                            },
                                            volumeName: {
                                              type: 'string',
                                            },
                                          },
                                          type: 'object',
                                        },
                                      },
                                      required: [
                                        'spec',
                                      ],
                                      type: 'object',
                                    },
                                  },
                                  type: 'object',
                                },
                                fc: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    lun: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    targetWWNs: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    wwids: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                  },
                                  type: 'object',
                                },
                                flexVolume: {
                                  properties: {
                                    driver: {
                                      type: 'string',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    options: {
                                      additionalProperties: {
                                        type: 'string',
                                      },
                                      type: 'object',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'driver',
                                  ],
                                  type: 'object',
                                },
                                flocker: {
                                  properties: {
                                    datasetName: {
                                      type: 'string',
                                    },
                                    datasetUUID: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                gcePersistentDisk: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    partition: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    pdName: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'pdName',
                                  ],
                                  type: 'object',
                                },
                                gitRepo: {
                                  properties: {
                                    directory: {
                                      type: 'string',
                                    },
                                    repository: {
                                      type: 'string',
                                    },
                                    revision: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'repository',
                                  ],
                                  type: 'object',
                                },
                                glusterfs: {
                                  properties: {
                                    endpoints: {
                                      type: 'string',
                                    },
                                    path: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'endpoints',
                                    'path',
                                  ],
                                  type: 'object',
                                },
                                hostPath: {
                                  properties: {
                                    path: {
                                      type: 'string',
                                    },
                                    type: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'path',
                                  ],
                                  type: 'object',
                                },
                                iscsi: {
                                  properties: {
                                    chapAuthDiscovery: {
                                      type: 'boolean',
                                    },
                                    chapAuthSession: {
                                      type: 'boolean',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    initiatorName: {
                                      type: 'string',
                                    },
                                    iqn: {
                                      type: 'string',
                                    },
                                    iscsiInterface: {
                                      type: 'string',
                                    },
                                    lun: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    portals: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    targetPortal: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'iqn',
                                    'lun',
                                    'targetPortal',
                                  ],
                                  type: 'object',
                                },
                                name: {
                                  type: 'string',
                                },
                                nfs: {
                                  properties: {
                                    path: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    server: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'path',
                                    'server',
                                  ],
                                  type: 'object',
                                },
                                persistentVolumeClaim: {
                                  properties: {
                                    claimName: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'claimName',
                                  ],
                                  type: 'object',
                                },
                                photonPersistentDisk: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    pdID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'pdID',
                                  ],
                                  type: 'object',
                                },
                                portworxVolume: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumeID',
                                  ],
                                  type: 'object',
                                },
                                projected: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    sources: {
                                      items: {
                                        properties: {
                                          configMap: {
                                            properties: {
                                              items: {
                                                items: {
                                                  properties: {
                                                    key: {
                                                      type: 'string',
                                                    },
                                                    mode: {
                                                      format: 'int32',
                                                      type: 'integer',
                                                    },
                                                    path: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'key',
                                                    'path',
                                                  ],
                                                  type: 'object',
                                                },
                                                type: 'array',
                                              },
                                              name: {
                                                type: 'string',
                                              },
                                              optional: {
                                                type: 'boolean',
                                              },
                                            },
                                            type: 'object',
                                          },
                                          downwardAPI: {
                                            properties: {
                                              items: {
                                                items: {
                                                  properties: {
                                                    fieldRef: {
                                                      properties: {
                                                        apiVersion: {
                                                          type: 'string',
                                                        },
                                                        fieldPath: {
                                                          type: 'string',
                                                        },
                                                      },
                                                      required: [
                                                        'fieldPath',
                                                      ],
                                                      type: 'object',
                                                    },
                                                    mode: {
                                                      format: 'int32',
                                                      type: 'integer',
                                                    },
                                                    path: {
                                                      type: 'string',
                                                    },
                                                    resourceFieldRef: {
                                                      properties: {
                                                        containerName: {
                                                          type: 'string',
                                                        },
                                                        divisor: {
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
                                                        resource: {
                                                          type: 'string',
                                                        },
                                                      },
                                                      required: [
                                                        'resource',
                                                      ],
                                                      type: 'object',
                                                    },
                                                  },
                                                  required: [
                                                    'path',
                                                  ],
                                                  type: 'object',
                                                },
                                                type: 'array',
                                              },
                                            },
                                            type: 'object',
                                          },
                                          secret: {
                                            properties: {
                                              items: {
                                                items: {
                                                  properties: {
                                                    key: {
                                                      type: 'string',
                                                    },
                                                    mode: {
                                                      format: 'int32',
                                                      type: 'integer',
                                                    },
                                                    path: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'key',
                                                    'path',
                                                  ],
                                                  type: 'object',
                                                },
                                                type: 'array',
                                              },
                                              name: {
                                                type: 'string',
                                              },
                                              optional: {
                                                type: 'boolean',
                                              },
                                            },
                                            type: 'object',
                                          },
                                          serviceAccountToken: {
                                            properties: {
                                              audience: {
                                                type: 'string',
                                              },
                                              expirationSeconds: {
                                                format: 'int64',
                                                type: 'integer',
                                              },
                                              path: {
                                                type: 'string',
                                              },
                                            },
                                            required: [
                                              'path',
                                            ],
                                            type: 'object',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                  },
                                  type: 'object',
                                },
                                quobyte: {
                                  properties: {
                                    group: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    registry: {
                                      type: 'string',
                                    },
                                    tenant: {
                                      type: 'string',
                                    },
                                    user: {
                                      type: 'string',
                                    },
                                    volume: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'registry',
                                    'volume',
                                  ],
                                  type: 'object',
                                },
                                rbd: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    image: {
                                      type: 'string',
                                    },
                                    keyring: {
                                      type: 'string',
                                    },
                                    monitors: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    pool: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    user: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'image',
                                    'monitors',
                                  ],
                                  type: 'object',
                                },
                                scaleIO: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    gateway: {
                                      type: 'string',
                                    },
                                    protectionDomain: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    sslEnabled: {
                                      type: 'boolean',
                                    },
                                    storageMode: {
                                      type: 'string',
                                    },
                                    storagePool: {
                                      type: 'string',
                                    },
                                    system: {
                                      type: 'string',
                                    },
                                    volumeName: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'gateway',
                                    'secretRef',
                                    'system',
                                  ],
                                  type: 'object',
                                },
                                secret: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    items: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          mode: {
                                            format: 'int32',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'key',
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                    optional: {
                                      type: 'boolean',
                                    },
                                    secretName: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                storageos: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    volumeName: {
                                      type: 'string',
                                    },
                                    volumeNamespace: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                vsphereVolume: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    storagePolicyID: {
                                      type: 'string',
                                    },
                                    storagePolicyName: {
                                      type: 'string',
                                    },
                                    volumePath: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumePath',
                                  ],
                                  type: 'object',
                                },
                              },
                              required: [
                                'name',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                            'x-kubernetes-list-type': 'atomic',
                          },
                        },
                        type: 'object',
                      },
                      esRollover: {
                        properties: {
                          affinity: {
                            properties: {
                              nodeAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        preference: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                            matchFields: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                          },
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'preference',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    properties: {
                                      nodeSelectorTerms: {
                                        items: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                            matchFields: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                          },
                                          type: 'object',
                                        },
                                        type: 'array',
                                      },
                                    },
                                    required: [
                                      'nodeSelectorTerms',
                                    ],
                                    type: 'object',
                                  },
                                },
                                type: 'object',
                              },
                              podAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        podAffinityTerm: {
                                          properties: {
                                            labelSelector: {
                                              properties: {
                                                matchExpressions: {
                                                  items: {
                                                    properties: {
                                                      key: {
                                                        type: 'string',
                                                      },
                                                      operator: {
                                                        type: 'string',
                                                      },
                                                      values: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            namespaces: {
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                            topologyKey: {
                                              type: 'string',
                                            },
                                          },
                                          required: [
                                            'topologyKey',
                                          ],
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'podAffinityTerm',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                },
                                type: 'object',
                              },
                              podAntiAffinity: {
                                properties: {
                                  preferredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        podAffinityTerm: {
                                          properties: {
                                            labelSelector: {
                                              properties: {
                                                matchExpressions: {
                                                  items: {
                                                    properties: {
                                                      key: {
                                                        type: 'string',
                                                      },
                                                      operator: {
                                                        type: 'string',
                                                      },
                                                      values: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            namespaces: {
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                            topologyKey: {
                                              type: 'string',
                                            },
                                          },
                                          required: [
                                            'topologyKey',
                                          ],
                                          type: 'object',
                                        },
                                        weight: {
                                          format: 'int32',
                                          type: 'integer',
                                        },
                                      },
                                      required: [
                                        'podAffinityTerm',
                                        'weight',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  requiredDuringSchedulingIgnoredDuringExecution: {
                                    items: {
                                      properties: {
                                        labelSelector: {
                                          properties: {
                                            matchExpressions: {
                                              items: {
                                                properties: {
                                                  key: {
                                                    type: 'string',
                                                  },
                                                  operator: {
                                                    type: 'string',
                                                  },
                                                  values: {
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
                                              type: 'object',
                                            },
                                          },
                                          type: 'object',
                                        },
                                        namespaces: {
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                        topologyKey: {
                                          type: 'string',
                                        },
                                      },
                                      required: [
                                        'topologyKey',
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
                          annotations: {
                            additionalProperties: {
                              type: 'string',
                            },
                            nullable: true,
                            type: 'object',
                          },
                          backoffLimit: {
                            format: 'int32',
                            type: 'integer',
                          },
                          conditions: {
                            type: 'string',
                          },
                          image: {
                            type: 'string',
                          },
                          labels: {
                            additionalProperties: {
                              type: 'string',
                            },
                            type: 'object',
                          },
                          readTTL: {
                            type: 'string',
                          },
                          resources: {
                            nullable: true,
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
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          schedule: {
                            type: 'string',
                          },
                          securityContext: {
                            properties: {
                              fsGroup: {
                                format: 'int64',
                                type: 'integer',
                              },
                              fsGroupChangePolicy: {
                                type: 'string',
                              },
                              runAsGroup: {
                                format: 'int64',
                                type: 'integer',
                              },
                              runAsNonRoot: {
                                type: 'boolean',
                              },
                              runAsUser: {
                                format: 'int64',
                                type: 'integer',
                              },
                              seLinuxOptions: {
                                properties: {
                                  level: {
                                    type: 'string',
                                  },
                                  role: {
                                    type: 'string',
                                  },
                                  type: {
                                    type: 'string',
                                  },
                                  user: {
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                              seccompProfile: {
                                properties: {
                                  localhostProfile: {
                                    type: 'string',
                                  },
                                  type: {
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'type',
                                ],
                                type: 'object',
                              },
                              supplementalGroups: {
                                items: {
                                  format: 'int64',
                                  type: 'integer',
                                },
                                type: 'array',
                              },
                              sysctls: {
                                items: {
                                  properties: {
                                    name: {
                                      type: 'string',
                                    },
                                    value: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'name',
                                    'value',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              windowsOptions: {
                                properties: {
                                  gmsaCredentialSpec: {
                                    type: 'string',
                                  },
                                  gmsaCredentialSpecName: {
                                    type: 'string',
                                  },
                                  runAsUserName: {
                                    type: 'string',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          serviceAccount: {
                            type: 'string',
                          },
                          successfulJobsHistoryLimit: {
                            format: 'int32',
                            type: 'integer',
                          },
                          tolerations: {
                            items: {
                              properties: {
                                effect: {
                                  type: 'string',
                                },
                                key: {
                                  type: 'string',
                                },
                                operator: {
                                  type: 'string',
                                },
                                tolerationSeconds: {
                                  format: 'int64',
                                  type: 'integer',
                                },
                                value: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            type: 'array',
                            'x-kubernetes-list-type': 'atomic',
                          },
                          ttlSecondsAfterFinished: {
                            format: 'int32',
                            type: 'integer',
                          },
                          volumeMounts: {
                            items: {
                              properties: {
                                mountPath: {
                                  type: 'string',
                                },
                                mountPropagation: {
                                  type: 'string',
                                },
                                name: {
                                  type: 'string',
                                },
                                readOnly: {
                                  type: 'boolean',
                                },
                                subPath: {
                                  type: 'string',
                                },
                                subPathExpr: {
                                  type: 'string',
                                },
                              },
                              required: [
                                'mountPath',
                                'name',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                            'x-kubernetes-list-type': 'atomic',
                          },
                          volumes: {
                            items: {
                              properties: {
                                awsElasticBlockStore: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    partition: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumeID',
                                  ],
                                  type: 'object',
                                },
                                azureDisk: {
                                  properties: {
                                    cachingMode: {
                                      type: 'string',
                                    },
                                    diskName: {
                                      type: 'string',
                                    },
                                    diskURI: {
                                      type: 'string',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    kind: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'diskName',
                                    'diskURI',
                                  ],
                                  type: 'object',
                                },
                                azureFile: {
                                  properties: {
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretName: {
                                      type: 'string',
                                    },
                                    shareName: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'secretName',
                                    'shareName',
                                  ],
                                  type: 'object',
                                },
                                cephfs: {
                                  properties: {
                                    monitors: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    path: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretFile: {
                                      type: 'string',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    user: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'monitors',
                                  ],
                                  type: 'object',
                                },
                                cinder: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    volumeID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumeID',
                                  ],
                                  type: 'object',
                                },
                                configMap: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    items: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          mode: {
                                            format: 'int32',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'key',
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                    name: {
                                      type: 'string',
                                    },
                                    optional: {
                                      type: 'boolean',
                                    },
                                  },
                                  type: 'object',
                                },
                                csi: {
                                  properties: {
                                    driver: {
                                      type: 'string',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    nodePublishSecretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeAttributes: {
                                      additionalProperties: {
                                        type: 'string',
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'driver',
                                  ],
                                  type: 'object',
                                },
                                downwardAPI: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    items: {
                                      items: {
                                        properties: {
                                          fieldRef: {
                                            properties: {
                                              apiVersion: {
                                                type: 'string',
                                              },
                                              fieldPath: {
                                                type: 'string',
                                              },
                                            },
                                            required: [
                                              'fieldPath',
                                            ],
                                            type: 'object',
                                          },
                                          mode: {
                                            format: 'int32',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                          resourceFieldRef: {
                                            properties: {
                                              containerName: {
                                                type: 'string',
                                              },
                                              divisor: {
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
                                              resource: {
                                                type: 'string',
                                              },
                                            },
                                            required: [
                                              'resource',
                                            ],
                                            type: 'object',
                                          },
                                        },
                                        required: [
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                  },
                                  type: 'object',
                                },
                                emptyDir: {
                                  properties: {
                                    medium: {
                                      type: 'string',
                                    },
                                    sizeLimit: {
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
                                  },
                                  type: 'object',
                                },
                                ephemeral: {
                                  properties: {
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeClaimTemplate: {
                                      properties: {
                                        metadata: {
                                          type: 'object',
                                        },
                                        spec: {
                                          properties: {
                                            accessModes: {
                                              items: {
                                                type: 'string',
                                              },
                                              type: 'array',
                                            },
                                            dataSource: {
                                              properties: {
                                                apiGroup: {
                                                  type: 'string',
                                                },
                                                kind: {
                                                  type: 'string',
                                                },
                                                name: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            selector: {
                                              properties: {
                                                matchExpressions: {
                                                  items: {
                                                    properties: {
                                                      key: {
                                                        type: 'string',
                                                      },
                                                      operator: {
                                                        type: 'string',
                                                      },
                                                      values: {
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
                                                  type: 'object',
                                                },
                                              },
                                              type: 'object',
                                            },
                                            storageClassName: {
                                              type: 'string',
                                            },
                                            volumeMode: {
                                              type: 'string',
                                            },
                                            volumeName: {
                                              type: 'string',
                                            },
                                          },
                                          type: 'object',
                                        },
                                      },
                                      required: [
                                        'spec',
                                      ],
                                      type: 'object',
                                    },
                                  },
                                  type: 'object',
                                },
                                fc: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    lun: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    targetWWNs: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    wwids: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                  },
                                  type: 'object',
                                },
                                flexVolume: {
                                  properties: {
                                    driver: {
                                      type: 'string',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    options: {
                                      additionalProperties: {
                                        type: 'string',
                                      },
                                      type: 'object',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                  },
                                  required: [
                                    'driver',
                                  ],
                                  type: 'object',
                                },
                                flocker: {
                                  properties: {
                                    datasetName: {
                                      type: 'string',
                                    },
                                    datasetUUID: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                gcePersistentDisk: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    partition: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    pdName: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'pdName',
                                  ],
                                  type: 'object',
                                },
                                gitRepo: {
                                  properties: {
                                    directory: {
                                      type: 'string',
                                    },
                                    repository: {
                                      type: 'string',
                                    },
                                    revision: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'repository',
                                  ],
                                  type: 'object',
                                },
                                glusterfs: {
                                  properties: {
                                    endpoints: {
                                      type: 'string',
                                    },
                                    path: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'endpoints',
                                    'path',
                                  ],
                                  type: 'object',
                                },
                                hostPath: {
                                  properties: {
                                    path: {
                                      type: 'string',
                                    },
                                    type: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'path',
                                  ],
                                  type: 'object',
                                },
                                iscsi: {
                                  properties: {
                                    chapAuthDiscovery: {
                                      type: 'boolean',
                                    },
                                    chapAuthSession: {
                                      type: 'boolean',
                                    },
                                    fsType: {
                                      type: 'string',
                                    },
                                    initiatorName: {
                                      type: 'string',
                                    },
                                    iqn: {
                                      type: 'string',
                                    },
                                    iscsiInterface: {
                                      type: 'string',
                                    },
                                    lun: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    portals: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    targetPortal: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'iqn',
                                    'lun',
                                    'targetPortal',
                                  ],
                                  type: 'object',
                                },
                                name: {
                                  type: 'string',
                                },
                                nfs: {
                                  properties: {
                                    path: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    server: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'path',
                                    'server',
                                  ],
                                  type: 'object',
                                },
                                persistentVolumeClaim: {
                                  properties: {
                                    claimName: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                  },
                                  required: [
                                    'claimName',
                                  ],
                                  type: 'object',
                                },
                                photonPersistentDisk: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    pdID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'pdID',
                                  ],
                                  type: 'object',
                                },
                                portworxVolume: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    volumeID: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumeID',
                                  ],
                                  type: 'object',
                                },
                                projected: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    sources: {
                                      items: {
                                        properties: {
                                          configMap: {
                                            properties: {
                                              items: {
                                                items: {
                                                  properties: {
                                                    key: {
                                                      type: 'string',
                                                    },
                                                    mode: {
                                                      format: 'int32',
                                                      type: 'integer',
                                                    },
                                                    path: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'key',
                                                    'path',
                                                  ],
                                                  type: 'object',
                                                },
                                                type: 'array',
                                              },
                                              name: {
                                                type: 'string',
                                              },
                                              optional: {
                                                type: 'boolean',
                                              },
                                            },
                                            type: 'object',
                                          },
                                          downwardAPI: {
                                            properties: {
                                              items: {
                                                items: {
                                                  properties: {
                                                    fieldRef: {
                                                      properties: {
                                                        apiVersion: {
                                                          type: 'string',
                                                        },
                                                        fieldPath: {
                                                          type: 'string',
                                                        },
                                                      },
                                                      required: [
                                                        'fieldPath',
                                                      ],
                                                      type: 'object',
                                                    },
                                                    mode: {
                                                      format: 'int32',
                                                      type: 'integer',
                                                    },
                                                    path: {
                                                      type: 'string',
                                                    },
                                                    resourceFieldRef: {
                                                      properties: {
                                                        containerName: {
                                                          type: 'string',
                                                        },
                                                        divisor: {
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
                                                        resource: {
                                                          type: 'string',
                                                        },
                                                      },
                                                      required: [
                                                        'resource',
                                                      ],
                                                      type: 'object',
                                                    },
                                                  },
                                                  required: [
                                                    'path',
                                                  ],
                                                  type: 'object',
                                                },
                                                type: 'array',
                                              },
                                            },
                                            type: 'object',
                                          },
                                          secret: {
                                            properties: {
                                              items: {
                                                items: {
                                                  properties: {
                                                    key: {
                                                      type: 'string',
                                                    },
                                                    mode: {
                                                      format: 'int32',
                                                      type: 'integer',
                                                    },
                                                    path: {
                                                      type: 'string',
                                                    },
                                                  },
                                                  required: [
                                                    'key',
                                                    'path',
                                                  ],
                                                  type: 'object',
                                                },
                                                type: 'array',
                                              },
                                              name: {
                                                type: 'string',
                                              },
                                              optional: {
                                                type: 'boolean',
                                              },
                                            },
                                            type: 'object',
                                          },
                                          serviceAccountToken: {
                                            properties: {
                                              audience: {
                                                type: 'string',
                                              },
                                              expirationSeconds: {
                                                format: 'int64',
                                                type: 'integer',
                                              },
                                              path: {
                                                type: 'string',
                                              },
                                            },
                                            required: [
                                              'path',
                                            ],
                                            type: 'object',
                                          },
                                        },
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                  },
                                  type: 'object',
                                },
                                quobyte: {
                                  properties: {
                                    group: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    registry: {
                                      type: 'string',
                                    },
                                    tenant: {
                                      type: 'string',
                                    },
                                    user: {
                                      type: 'string',
                                    },
                                    volume: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'registry',
                                    'volume',
                                  ],
                                  type: 'object',
                                },
                                rbd: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    image: {
                                      type: 'string',
                                    },
                                    keyring: {
                                      type: 'string',
                                    },
                                    monitors: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    pool: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    user: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'image',
                                    'monitors',
                                  ],
                                  type: 'object',
                                },
                                scaleIO: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    gateway: {
                                      type: 'string',
                                    },
                                    protectionDomain: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    sslEnabled: {
                                      type: 'boolean',
                                    },
                                    storageMode: {
                                      type: 'string',
                                    },
                                    storagePool: {
                                      type: 'string',
                                    },
                                    system: {
                                      type: 'string',
                                    },
                                    volumeName: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'gateway',
                                    'secretRef',
                                    'system',
                                  ],
                                  type: 'object',
                                },
                                secret: {
                                  properties: {
                                    defaultMode: {
                                      format: 'int32',
                                      type: 'integer',
                                    },
                                    items: {
                                      items: {
                                        properties: {
                                          key: {
                                            type: 'string',
                                          },
                                          mode: {
                                            format: 'int32',
                                            type: 'integer',
                                          },
                                          path: {
                                            type: 'string',
                                          },
                                        },
                                        required: [
                                          'key',
                                          'path',
                                        ],
                                        type: 'object',
                                      },
                                      type: 'array',
                                    },
                                    optional: {
                                      type: 'boolean',
                                    },
                                    secretName: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                storageos: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    readOnly: {
                                      type: 'boolean',
                                    },
                                    secretRef: {
                                      properties: {
                                        name: {
                                          type: 'string',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    volumeName: {
                                      type: 'string',
                                    },
                                    volumeNamespace: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                                vsphereVolume: {
                                  properties: {
                                    fsType: {
                                      type: 'string',
                                    },
                                    storagePolicyID: {
                                      type: 'string',
                                    },
                                    storagePolicyName: {
                                      type: 'string',
                                    },
                                    volumePath: {
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'volumePath',
                                  ],
                                  type: 'object',
                                },
                              },
                              required: [
                                'name',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                            'x-kubernetes-list-type': 'atomic',
                          },
                        },
                        type: 'object',
                      },
                      grpcPlugin: {
                        properties: {
                          image: {
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      options: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                      secretName: {
                        type: 'string',
                      },
                      type: {
                        type: 'string',
                      },
                    },
                    type: 'object',
                  },
                  strategy: {
                    type: 'string',
                  },
                  tolerations: {
                    items: {
                      properties: {
                        effect: {
                          type: 'string',
                        },
                        key: {
                          type: 'string',
                        },
                        operator: {
                          type: 'string',
                        },
                        tolerationSeconds: {
                          format: 'int64',
                          type: 'integer',
                        },
                        value: {
                          type: 'string',
                        },
                      },
                      type: 'object',
                    },
                    type: 'array',
                    'x-kubernetes-list-type': 'atomic',
                  },
                  ui: {
                    properties: {
                      options: {
                        type: 'object',
                        'x-kubernetes-preserve-unknown-fields': true,
                      },
                    },
                    type: 'object',
                  },
                  volumeMounts: {
                    items: {
                      properties: {
                        mountPath: {
                          type: 'string',
                        },
                        mountPropagation: {
                          type: 'string',
                        },
                        name: {
                          type: 'string',
                        },
                        readOnly: {
                          type: 'boolean',
                        },
                        subPath: {
                          type: 'string',
                        },
                        subPathExpr: {
                          type: 'string',
                        },
                      },
                      required: [
                        'mountPath',
                        'name',
                      ],
                      type: 'object',
                    },
                    type: 'array',
                    'x-kubernetes-list-type': 'atomic',
                  },
                  volumes: {
                    items: {
                      properties: {
                        awsElasticBlockStore: {
                          properties: {
                            fsType: {
                              type: 'string',
                            },
                            partition: {
                              format: 'int32',
                              type: 'integer',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            volumeID: {
                              type: 'string',
                            },
                          },
                          required: [
                            'volumeID',
                          ],
                          type: 'object',
                        },
                        azureDisk: {
                          properties: {
                            cachingMode: {
                              type: 'string',
                            },
                            diskName: {
                              type: 'string',
                            },
                            diskURI: {
                              type: 'string',
                            },
                            fsType: {
                              type: 'string',
                            },
                            kind: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                          },
                          required: [
                            'diskName',
                            'diskURI',
                          ],
                          type: 'object',
                        },
                        azureFile: {
                          properties: {
                            readOnly: {
                              type: 'boolean',
                            },
                            secretName: {
                              type: 'string',
                            },
                            shareName: {
                              type: 'string',
                            },
                          },
                          required: [
                            'secretName',
                            'shareName',
                          ],
                          type: 'object',
                        },
                        cephfs: {
                          properties: {
                            monitors: {
                              items: {
                                type: 'string',
                              },
                              type: 'array',
                            },
                            path: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            secretFile: {
                              type: 'string',
                            },
                            secretRef: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            user: {
                              type: 'string',
                            },
                          },
                          required: [
                            'monitors',
                          ],
                          type: 'object',
                        },
                        cinder: {
                          properties: {
                            fsType: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            secretRef: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            volumeID: {
                              type: 'string',
                            },
                          },
                          required: [
                            'volumeID',
                          ],
                          type: 'object',
                        },
                        configMap: {
                          properties: {
                            defaultMode: {
                              format: 'int32',
                              type: 'integer',
                            },
                            items: {
                              items: {
                                properties: {
                                  key: {
                                    type: 'string',
                                  },
                                  mode: {
                                    format: 'int32',
                                    type: 'integer',
                                  },
                                  path: {
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'path',
                                ],
                                type: 'object',
                              },
                              type: 'array',
                            },
                            name: {
                              type: 'string',
                            },
                            optional: {
                              type: 'boolean',
                            },
                          },
                          type: 'object',
                        },
                        csi: {
                          properties: {
                            driver: {
                              type: 'string',
                            },
                            fsType: {
                              type: 'string',
                            },
                            nodePublishSecretRef: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            volumeAttributes: {
                              additionalProperties: {
                                type: 'string',
                              },
                              type: 'object',
                            },
                          },
                          required: [
                            'driver',
                          ],
                          type: 'object',
                        },
                        downwardAPI: {
                          properties: {
                            defaultMode: {
                              format: 'int32',
                              type: 'integer',
                            },
                            items: {
                              items: {
                                properties: {
                                  fieldRef: {
                                    properties: {
                                      apiVersion: {
                                        type: 'string',
                                      },
                                      fieldPath: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'fieldPath',
                                    ],
                                    type: 'object',
                                  },
                                  mode: {
                                    format: 'int32',
                                    type: 'integer',
                                  },
                                  path: {
                                    type: 'string',
                                  },
                                  resourceFieldRef: {
                                    properties: {
                                      containerName: {
                                        type: 'string',
                                      },
                                      divisor: {
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
                                      resource: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'resource',
                                    ],
                                    type: 'object',
                                  },
                                },
                                required: [
                                  'path',
                                ],
                                type: 'object',
                              },
                              type: 'array',
                            },
                          },
                          type: 'object',
                        },
                        emptyDir: {
                          properties: {
                            medium: {
                              type: 'string',
                            },
                            sizeLimit: {
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
                          },
                          type: 'object',
                        },
                        ephemeral: {
                          properties: {
                            readOnly: {
                              type: 'boolean',
                            },
                            volumeClaimTemplate: {
                              properties: {
                                metadata: {
                                  type: 'object',
                                },
                                spec: {
                                  properties: {
                                    accessModes: {
                                      items: {
                                        type: 'string',
                                      },
                                      type: 'array',
                                    },
                                    dataSource: {
                                      properties: {
                                        apiGroup: {
                                          type: 'string',
                                        },
                                        kind: {
                                          type: 'string',
                                        },
                                        name: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    selector: {
                                      properties: {
                                        matchExpressions: {
                                          items: {
                                            properties: {
                                              key: {
                                                type: 'string',
                                              },
                                              operator: {
                                                type: 'string',
                                              },
                                              values: {
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
                                          type: 'object',
                                        },
                                      },
                                      type: 'object',
                                    },
                                    storageClassName: {
                                      type: 'string',
                                    },
                                    volumeMode: {
                                      type: 'string',
                                    },
                                    volumeName: {
                                      type: 'string',
                                    },
                                  },
                                  type: 'object',
                                },
                              },
                              required: [
                                'spec',
                              ],
                              type: 'object',
                            },
                          },
                          type: 'object',
                        },
                        fc: {
                          properties: {
                            fsType: {
                              type: 'string',
                            },
                            lun: {
                              format: 'int32',
                              type: 'integer',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            targetWWNs: {
                              items: {
                                type: 'string',
                              },
                              type: 'array',
                            },
                            wwids: {
                              items: {
                                type: 'string',
                              },
                              type: 'array',
                            },
                          },
                          type: 'object',
                        },
                        flexVolume: {
                          properties: {
                            driver: {
                              type: 'string',
                            },
                            fsType: {
                              type: 'string',
                            },
                            options: {
                              additionalProperties: {
                                type: 'string',
                              },
                              type: 'object',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            secretRef: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                          },
                          required: [
                            'driver',
                          ],
                          type: 'object',
                        },
                        flocker: {
                          properties: {
                            datasetName: {
                              type: 'string',
                            },
                            datasetUUID: {
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        gcePersistentDisk: {
                          properties: {
                            fsType: {
                              type: 'string',
                            },
                            partition: {
                              format: 'int32',
                              type: 'integer',
                            },
                            pdName: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                          },
                          required: [
                            'pdName',
                          ],
                          type: 'object',
                        },
                        gitRepo: {
                          properties: {
                            directory: {
                              type: 'string',
                            },
                            repository: {
                              type: 'string',
                            },
                            revision: {
                              type: 'string',
                            },
                          },
                          required: [
                            'repository',
                          ],
                          type: 'object',
                        },
                        glusterfs: {
                          properties: {
                            endpoints: {
                              type: 'string',
                            },
                            path: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                          },
                          required: [
                            'endpoints',
                            'path',
                          ],
                          type: 'object',
                        },
                        hostPath: {
                          properties: {
                            path: {
                              type: 'string',
                            },
                            type: {
                              type: 'string',
                            },
                          },
                          required: [
                            'path',
                          ],
                          type: 'object',
                        },
                        iscsi: {
                          properties: {
                            chapAuthDiscovery: {
                              type: 'boolean',
                            },
                            chapAuthSession: {
                              type: 'boolean',
                            },
                            fsType: {
                              type: 'string',
                            },
                            initiatorName: {
                              type: 'string',
                            },
                            iqn: {
                              type: 'string',
                            },
                            iscsiInterface: {
                              type: 'string',
                            },
                            lun: {
                              format: 'int32',
                              type: 'integer',
                            },
                            portals: {
                              items: {
                                type: 'string',
                              },
                              type: 'array',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            secretRef: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            targetPortal: {
                              type: 'string',
                            },
                          },
                          required: [
                            'iqn',
                            'lun',
                            'targetPortal',
                          ],
                          type: 'object',
                        },
                        name: {
                          type: 'string',
                        },
                        nfs: {
                          properties: {
                            path: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            server: {
                              type: 'string',
                            },
                          },
                          required: [
                            'path',
                            'server',
                          ],
                          type: 'object',
                        },
                        persistentVolumeClaim: {
                          properties: {
                            claimName: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                          },
                          required: [
                            'claimName',
                          ],
                          type: 'object',
                        },
                        photonPersistentDisk: {
                          properties: {
                            fsType: {
                              type: 'string',
                            },
                            pdID: {
                              type: 'string',
                            },
                          },
                          required: [
                            'pdID',
                          ],
                          type: 'object',
                        },
                        portworxVolume: {
                          properties: {
                            fsType: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            volumeID: {
                              type: 'string',
                            },
                          },
                          required: [
                            'volumeID',
                          ],
                          type: 'object',
                        },
                        projected: {
                          properties: {
                            defaultMode: {
                              format: 'int32',
                              type: 'integer',
                            },
                            sources: {
                              items: {
                                properties: {
                                  configMap: {
                                    properties: {
                                      items: {
                                        items: {
                                          properties: {
                                            key: {
                                              type: 'string',
                                            },
                                            mode: {
                                              format: 'int32',
                                              type: 'integer',
                                            },
                                            path: {
                                              type: 'string',
                                            },
                                          },
                                          required: [
                                            'key',
                                            'path',
                                          ],
                                          type: 'object',
                                        },
                                        type: 'array',
                                      },
                                      name: {
                                        type: 'string',
                                      },
                                      optional: {
                                        type: 'boolean',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  downwardAPI: {
                                    properties: {
                                      items: {
                                        items: {
                                          properties: {
                                            fieldRef: {
                                              properties: {
                                                apiVersion: {
                                                  type: 'string',
                                                },
                                                fieldPath: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'fieldPath',
                                              ],
                                              type: 'object',
                                            },
                                            mode: {
                                              format: 'int32',
                                              type: 'integer',
                                            },
                                            path: {
                                              type: 'string',
                                            },
                                            resourceFieldRef: {
                                              properties: {
                                                containerName: {
                                                  type: 'string',
                                                },
                                                divisor: {
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
                                                resource: {
                                                  type: 'string',
                                                },
                                              },
                                              required: [
                                                'resource',
                                              ],
                                              type: 'object',
                                            },
                                          },
                                          required: [
                                            'path',
                                          ],
                                          type: 'object',
                                        },
                                        type: 'array',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  secret: {
                                    properties: {
                                      items: {
                                        items: {
                                          properties: {
                                            key: {
                                              type: 'string',
                                            },
                                            mode: {
                                              format: 'int32',
                                              type: 'integer',
                                            },
                                            path: {
                                              type: 'string',
                                            },
                                          },
                                          required: [
                                            'key',
                                            'path',
                                          ],
                                          type: 'object',
                                        },
                                        type: 'array',
                                      },
                                      name: {
                                        type: 'string',
                                      },
                                      optional: {
                                        type: 'boolean',
                                      },
                                    },
                                    type: 'object',
                                  },
                                  serviceAccountToken: {
                                    properties: {
                                      audience: {
                                        type: 'string',
                                      },
                                      expirationSeconds: {
                                        format: 'int64',
                                        type: 'integer',
                                      },
                                      path: {
                                        type: 'string',
                                      },
                                    },
                                    required: [
                                      'path',
                                    ],
                                    type: 'object',
                                  },
                                },
                                type: 'object',
                              },
                              type: 'array',
                            },
                          },
                          type: 'object',
                        },
                        quobyte: {
                          properties: {
                            group: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            registry: {
                              type: 'string',
                            },
                            tenant: {
                              type: 'string',
                            },
                            user: {
                              type: 'string',
                            },
                            volume: {
                              type: 'string',
                            },
                          },
                          required: [
                            'registry',
                            'volume',
                          ],
                          type: 'object',
                        },
                        rbd: {
                          properties: {
                            fsType: {
                              type: 'string',
                            },
                            image: {
                              type: 'string',
                            },
                            keyring: {
                              type: 'string',
                            },
                            monitors: {
                              items: {
                                type: 'string',
                              },
                              type: 'array',
                            },
                            pool: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            secretRef: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            user: {
                              type: 'string',
                            },
                          },
                          required: [
                            'image',
                            'monitors',
                          ],
                          type: 'object',
                        },
                        scaleIO: {
                          properties: {
                            fsType: {
                              type: 'string',
                            },
                            gateway: {
                              type: 'string',
                            },
                            protectionDomain: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            secretRef: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            sslEnabled: {
                              type: 'boolean',
                            },
                            storageMode: {
                              type: 'string',
                            },
                            storagePool: {
                              type: 'string',
                            },
                            system: {
                              type: 'string',
                            },
                            volumeName: {
                              type: 'string',
                            },
                          },
                          required: [
                            'gateway',
                            'secretRef',
                            'system',
                          ],
                          type: 'object',
                        },
                        secret: {
                          properties: {
                            defaultMode: {
                              format: 'int32',
                              type: 'integer',
                            },
                            items: {
                              items: {
                                properties: {
                                  key: {
                                    type: 'string',
                                  },
                                  mode: {
                                    format: 'int32',
                                    type: 'integer',
                                  },
                                  path: {
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'key',
                                  'path',
                                ],
                                type: 'object',
                              },
                              type: 'array',
                            },
                            optional: {
                              type: 'boolean',
                            },
                            secretName: {
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        storageos: {
                          properties: {
                            fsType: {
                              type: 'string',
                            },
                            readOnly: {
                              type: 'boolean',
                            },
                            secretRef: {
                              properties: {
                                name: {
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            volumeName: {
                              type: 'string',
                            },
                            volumeNamespace: {
                              type: 'string',
                            },
                          },
                          type: 'object',
                        },
                        vsphereVolume: {
                          properties: {
                            fsType: {
                              type: 'string',
                            },
                            storagePolicyID: {
                              type: 'string',
                            },
                            storagePolicyName: {
                              type: 'string',
                            },
                            volumePath: {
                              type: 'string',
                            },
                          },
                          required: [
                            'volumePath',
                          ],
                          type: 'object',
                        },
                      },
                      required: [
                        'name',
                      ],
                      type: 'object',
                    },
                    type: 'array',
                    'x-kubernetes-list-type': 'atomic',
                  },
                },
                type: 'object',
              },
              status: {
                properties: {
                  phase: {
                    type: 'string',
                  },
                  version: {
                    type: 'string',
                  },
                },
                required: [
                  'phase',
                  'version',
                ],
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
