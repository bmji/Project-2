require 'pg'
require 'httparty'
require 'pry'

val_api = HTTParty.get("https://valorant-api.com/v1/agents")

def run_sql(sql, params = [])
    db = PG.connect(dbname: valorant_db)
    data = db.exec_params(sql, params)
    db.close
    data
end

info = val_api['data']
agent_name = []

info.each do |agent|
    agent_name.push(agent['displayName'])
end

agent_name = agent_name.join(', ')

binding.pry