local jaegerOperator = import './components/jaeger-operator.libsonnet';
local jaeger = import './components/jaeger.libsonnet';

{
  values:: {
    common: {
      namespace: 'default',
      versions: {
        jaegerOperator: error 'must provide jaeger-operator version',
        jaeger: error 'must provide jaeger version',
      } + (import 'versions.json'),
      images: {
        jaegerOperator: 'jaegertracing/jaeger-operator:' + $.values.common.versions.jaegerOperator,
      },
    },

    jaegerOperatorParams: {
      namespace: $.values.common.namespace,
      image: $.values.common.images.jaegerOperator,
      version: $.values.common.versions.jaegerOperator,
    },

    jaegerParams: {
      namespace: $.values.common.namespace,
      version: $.values.common.versions.jaeger,
      strategy: 'production',
      storageType: 'elasticsearch',
      agentStrategy: 'DaemonSet',
    },
  },

  jaegerOperator: jaegerOperator($.values.jaegerOperatorParams),
  jaeger: jaeger($.values.jaegerParams),

  kubeJaeger: {
    namespace: {
      apiVersion: 'v1',
      kind: 'Namespace',
      metadata: {
        name: $.values.common.namespace,
      },
    },
  },
}
