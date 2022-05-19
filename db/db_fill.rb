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
agent_desc = []
agent_image_url = []
agent_role = []
agent_voiceline = []

info.each do |agent|
    if agent['isPlayableCharacter']
        agent_name.push(agent['displayName'])
        agent_desc.push(agent['description'])
        agent_image_url.push(agent['displayIcon'])
        agent_role.push(agent['role']['displayName'])
        agent_voiceline.push(agent['voiceLine']['mediaList'][0]['wave'])
    end
end

# run_sql("INSERT INTO valorant_db (name, image_url, role, voiceline VALUES ($1, $2, $3, $4, $5)", [agent_name, agent_desc, agent_image_url, agent_role, agent_voiceline])


binding.pry