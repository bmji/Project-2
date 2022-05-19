require 'pg'
require 'httparty'

info = HTTParty.get("https://valorant-api.com/v1/agents")

def run_sql(sql, params = [])
    db = PG.connect(dbname: valorant_db)
    data = db.exec_params(sql, params)
    db.close
    data
end

puts info['data']
