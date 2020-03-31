class Application 

    @@items = [Item.new("apples", 10), Item.new("oranges", 15)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            items_name = req.path.split("/items/").last
                if item = @@items.find{|item| item.name == items_name}
                 resp.write item.price
        else
            resp.status = 400
            resp.write  "Item not found"
        end
    else
        resp.status = 404
        resp.write "Route not found"
    end
        resp.finish
    end
end