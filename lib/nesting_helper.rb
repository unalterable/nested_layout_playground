module NestingHelper

  def nest(args)
   args.count >= 1 ? erb(args.pop) { nest(args) } : erb(args.last)
  end
end
