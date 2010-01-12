{application, concurrent,
 [{description, "concurrent"},
  {vsn, "0.01"},
  {modules, [
    concurrent,
    concurrent_app,
    concurrent_sup,
    concurrent_web,
    concurrent_deps
  ]},
  {registered, []},
  {mod, {concurrent_app, []}},
  {env, []},
  {applications, [kernel, stdlib, crypto]}]}.
