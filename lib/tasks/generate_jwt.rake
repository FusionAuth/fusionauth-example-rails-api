
desc 'generates a valid JWT'
task :generate_valid_jwt do
    exp = Time.now.to_i + (5*60)
    payload = { "iss": "fusionauth.io",
                "exp": exp,
                "aud": "238d4793-70de-4183-9707-48ed8ecd19d9",
                "sub": "19016b73-3ffa-4b26-80d8-aa9287738677",
                "name": "Dan Moore",
                "roles": ["USER"]
    }

    puts "Run this command once you've started rails"
    jwt = JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
    puts "curl -v -H 'Authorization: Bearer #{jwt}' http://localhost:4000/messages"
end

desc 'generates an invalid JWT'
task :generate_invalid_jwt do
    exp = Time.now.to_i - (5*60)
    payload = { "iss": "fusionauth.io",
                "exp": exp,
                "aud": "238d4793-70de-4183-9707-48ed8ecd19d9",
                "sub": "19016b73-3ffa-4b26-80d8-aa9287738677",
                "name": "Dan Moore",
                "roles": ["USER"]
    }

    puts "Run this command once you've started rails"
    jwt = JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
    puts "curl -v -H 'Authorization: Bearer #{jwt}' http://localhost:4000/messages"
end
