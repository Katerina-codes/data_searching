require 'program_manager'
require 'ui'
require 'data_searcher'

RSpec.describe ProgramManager do

  it "Returns a list of records that match user search" do
    input = StringIO.new("x")
    output = StringIO.new
    program_manager = ProgramManager.new(UI.new(output, input), DataSearcher.new(UI.new))
    program_manager.user_flow
    puts output.string
    expect(output.string).to include(
"""            Name            |            Role            |            Seperation Date            |
---------------------------- ---------------------------- ---------------------------------------
     Tou Xiong     |     Software Engineer     |    2016-12-31    |\n""")
  end

end
