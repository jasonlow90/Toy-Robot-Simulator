require("./map.rb")
require("./robot.rb")

module Command
  include Robot, Map
end
