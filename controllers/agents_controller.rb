get '/val_agents' do
    val_agents = all_agents
    agent_notes = all_notes.to_a
# binding.pry
    erb :'val/index', locals: {
        val_agents: val_agents,
        agent_notes: agent_notes
    }
end

get '/add_note' do
    note_id = params['note_id']

    erb :'/val/new', locals: {
        note_id: note_id
    }
end

put '/note' do
    note = params['note']
    tier = params['tier']
    note_id = params['note_id']

    add_note(note, tier, note_id)

    redirect '/'
end

get '/note/:id/edit' do
    id = params['id']

    note = get_note(id)

    erb :'/val/edit', locals: {
        note: note
    }
end

put '/note/:id/edit' do
    id = params['id']
    note = params['note']
    tier = params['tier']

    update_note(note, tier, id)

    redirect '/'
end

delete '/note/:id' do
    id = params['id']

    delete_note(id)

    redirect '/'
end