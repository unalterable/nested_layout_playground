module NestingHelper

  def nest(*args)
  args.count >= 1 ? erb(args.pop) { nest(args) } : erb(args.pop)

    # erb(args[0]) do
    #   erb(args[1]) do
    #     erb(args[2])
    #   end
    # end
  end

end
