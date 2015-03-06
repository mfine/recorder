module Endpoints
  class Root < Base
    get "/" do
      File.read(File.join('public', 'index.html'))
    end
  end
end
