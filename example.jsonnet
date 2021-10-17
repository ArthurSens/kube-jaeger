local kj = (import 'kube-jaeger/main.libsonnet') +
           {
             values+:: {
               common+: {
                 namespace: 'default',
               },
             },
           };

{ 'setup/0namespace-namespace': kj.kubeJaeger.namespace } +
{
  ['setup/jaeger-operator-' + name]: kj.jaegerOperator[name]
  for name in std.filter((function(name) name != 'serviceMonitor' && name != 'prometheusRule'), std.objectFields(kj.jaegerOperator))
} +
(
  if kj.values.jaegerParams.storageType == 'elasticsearch' then {
    ['setup/jaeger-elasticsearch-operator-' + name]: kj.jaeger.elasticsearchOperatorManifests[name]
    for name in std.filter((function(name) name != 'elasticsearch'), std.objectFields(kj.jaeger.elasticsearchOperatorManifests))
  } + {
    ['jaeger/setup/' + name]: kj.jaeger.elasticsearchOperatorManifests[name]
    for name in std.filter((function(name) name == 'elasticsearch'), std.objectFields(kj.jaeger.elasticsearchOperatorManifests))
  }  
  else {}
) +
{
  ['jaeger/' + name]: kj.jaeger[name]
  for name in std.filter((function(name) name != 'elasticsearchOperatorManifests'), std.objectFields(kj.jaeger))
}
