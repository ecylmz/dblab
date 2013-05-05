require 'savon'

client = Savon.client(wsdl: "http://localhost:3000/apis/wsdl")

client.operations

response = client.call(:get_product, message: { id: 1 })
