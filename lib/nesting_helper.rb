require 'erb'
require 'sinatra/base'

class NestingHelper 

  class LayoutRenderer
  end


    def nest(args)
   args.count >= 1 ? erb(args.pop){ nest(args) } : erb(args.last)
  end

  def erb(sym, &block)
    erb = ERB.new(find(sym))
    erb.def_method(LayoutRenderer, :render)
    puts block.methods.sort
    return LayoutRenderer.new.render{ block.call } if block_given?
    erb.result
  end

  def find(sym, ext = ".erb", folder = "views")
    filename = sym.to_s + ext
    dir = File.join(Dir.pwd, folder, filename)
    p '----------------------------'
    p dir
    p Dir.pwd
    file = File.open(dir, 'r')
    output_str = file.read
    file.close
    output_str
  end

end
