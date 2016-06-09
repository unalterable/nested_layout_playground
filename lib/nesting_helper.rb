module NestingHelper

  def nest(*args)
   args.flatten!
   args.last != :test ? erb(args.pop, layout: false) { nest(args) } : erb(args.last)
  end
end
