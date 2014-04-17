require "ExceptionCatchMiddleware/version"

module ExceptionCatchMiddleware
	class ExceptionCatcher
		def initialize app
			@app = app
		end

		def call env
			begin
				@app.call env
			rescue
				[ 500, { "Content-Type" => "application/json"}, [JSON.dump({ "message" => "unexpected error" })] ]
			end
		end
	end
end
