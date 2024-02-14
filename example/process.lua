handler = function(Message, Environment)
    local json = require('json')

    local ParsedMessage = json.decode(Message)
    local Hash = Extensions.SHA256(ParsedMessage.Message)

    Extensions.Log("Hash is " .. Hash)
    Extensions.Log("Message is " .. ParsedMessage.Message)
    Extensions.Log("Signature is " .. ParsedMessage.Signature)
    Extensions.Log("Address is " .. ParsedMessage.Address)

    local Result = Extensions.SigVerify(Hash, ParsedMessage.Signature, ParsedMessage.Address)
    Extensions.Log(Result)
    if Result then
        return "Correct signature!"
    else
        return "Invalid signature!"
    end
end

