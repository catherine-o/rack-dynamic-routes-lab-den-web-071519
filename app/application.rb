class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
    
        if req.path.match(/items/) 
            item_search = req.path.split("/items/").last
            if item = @@items.find{|i| i.name == item_search}
                resp.write item.price
            else
                resp.status = 400
                resp.write "Item not found"
            end
    
        else
          resp.write "Route not found"
          resp.status = 404
        end
        resp.finish
      end

      def self.all
        @@items
      end

end