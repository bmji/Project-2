def all_agents
    run_sql("SELECT * FROM agents ORDER BY id")
end

def all_notes
    run_sql("SELECT * FROM agent_notes ORDER BY id")
end

def add_note(note, tier, note_id)
    run_sql("UPDATE agent_notes SET notes = $1, tier = $2 WHERE id = $3", [note, tier, note_id])
end

def get_note(id)
    run_sql("SELECT * FROM agent_notes WHERE id = $1", [id])[0]
end

def get_agent_id(agent_id)
    run_sql("SELECT * FROM agents WHERE id = $1", [agent_id])[0]
end

def update_note(note, tier, id)
    run_sql("UPDATE agent_notes SET notes = $1, tier = $2 WHERE id = $3", [note, tier, id])
end

def delete_note(id)
    run_sql("UPDATE agent_notes SET notes = NULL, tier = NULL WHERE id = $1", [id])
end