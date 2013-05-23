require 'savon'

client = Savon.client(wsdl: "http://localhost:3000/soap/wsdl")

client.operations

response = client.call(:get_student, message: { id: 1 })
