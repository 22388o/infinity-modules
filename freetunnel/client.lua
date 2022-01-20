title = 'Free Tunnel Client'

description = [[
  Connects to a free tunnel server.
]]

models = {
  {
    name = 'server',
    display = 'Server',
    fields = {
      { name = 'server', type = 'string', required = true },
      { name = 'identifier', type = 'string', required = true }
    },
    single = true
  }
}

triggers = {
  init = function ()
    local server = db.server.get()
    if server then
      tunnel.open(server.server, server.identifier)
    end
  end,

  api_db_set = function (data)
    if data.value.identifier and data.value.identifier ~= '' then
      tunnel.open(data.value.server, data.value.identifier)
    end
  end
}
