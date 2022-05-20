require 'pg'
require 'httparty'

val_api = HTTParty.get("https://valorant-api.com/v1/agents")

def run_sql(sql, params = [])
    db = PG.connect(dbname: 'valorant_db')
    data = db.exec_params(sql, params)
    db.close
    data
end

info = val_api['data']

# for agents table

agent_name = []
agent_desc = []
agent_image_url = []
agent_full_portrait = []
agent_role = []
agent_voiceline = []

info.each do |agent|
    if agent['isPlayableCharacter']
        agent_name.push(agent['displayName'])
        agent_desc.push(agent['description'])
        agent_image_url.push(agent['displayIcon'])
        agent_full_portrait.push(agent['fullPortraitV2'])
        agent_role.push(agent['role']['displayName'])
        agent_voiceline.push(agent['voiceLine']['mediaList'][0]['wave'])
    end
end

agent_name.each_index do |i|
    run_sql("INSERT INTO agents (name, description, image_url, full_portrait, role, voiceline) VALUES ($1, $2, $3, $4, $5, $6)", [agent_name[i], agent_desc[i], agent_image_url[i], agent_full_portrait[i], agent_role[i], agent_voiceline[i]])
end

for agent_abilities table

agent_id = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 13, 13, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 18, 18, 18, 18, 19, 19, 19, 19]
ab_name = []
ab_desc = []
ab_image_icon = []

info.each do |agent|
    if agent['isPlayableCharacter']
        agent['abilities'].each do |ability|
            ab_name.push(ability['displayName'])
            ab_desc.push(ability['description'])
            ab_image_icon.push(ability['displayIcon'])
        end
    end
end

agent_id.each_index do |i|
    run_sql("INSERT INTO agent_abilities (agent_id, name, description, image_icon) VALUES ($1, $2, $3, $4)", [agent_id[i], ab_name[i], ab_desc[i], ab_image_icon[i]])
end

# for notes table

agent_id = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,]

agent_id.each_index do |i|
    run_sql("INSERT INTO agent_notes (agent_id) VALUES ($1)", [agent_id[i]])
end