require_relative ('./rooms')
require_relative ('./guests')
require_relative ('./songs')
require_relative ('./viewer')

class Runner

  def initialize(viewer)
    @viewer = viewer
  end

  def run()
    if @viewer.start == true
      @viewer.options_menu
    end
  end


end

Runner.new(Viewer.new).run