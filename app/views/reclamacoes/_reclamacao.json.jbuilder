json.extract! reclamacao, :id, :titulo, :descricao, :created_at, :updated_at
json.url reclamacao_url(reclamacao, format: :json)
