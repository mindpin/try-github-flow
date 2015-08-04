json.array!(@libochaos) do |libochao|
  json.extract! libochao, :id
  json.url libochao_url(libochao, format: :json)
end
