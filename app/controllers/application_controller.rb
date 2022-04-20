class ApplicationController < ActionController::Base
  def blank_square_form
    render({:template => "calculation_templates/square_form.html.erb"})
  end

  def blank_squareroot_form
    render({:template => "calculation_templates/squareroot_form.html.erb"})
  end

  def blank_payment_form
    render({:template => "calculation_templates/payment_form.html.erb"})
  end

  def blank_random_form
    render({:template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_square
    # params = {"e"=>"45"}
    @num = params.fetch("number").to_f
    @square_of_num = @num * @num 
    render({:template => "calculation_templates/square_results.html.erb"})
  end

  def calculate_squareroot
    @rootnum = params.fetch("user_number").to_f
    @squareroot_of_num = @rootnum ** 0.5
    render({:template => "calculation_templates/squareroot_results.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f.to_s(:percentage, precision: 4)
    @i = params.fetch("user_apr").to_f/12/100
    @year = params.fetch("user_years")
    @mths = @year.to_f*12
    @pv = params.fetch("user_pv").to_f.to_s(:currency)
    @prin = params.fetch("user_pv").to_f
    @payment = @prin.to_f*(@i*((1+@i)**(@mths))/((1+@i)**(@mths)-1))
    @payment = @payment.to_f.to_s(:currency)
    render({:template => "calculation_templates/payment_results.html.erb"})
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result  = rand(@lower.. @upper)
    render({:template => "calculation_templates/rand_results.html.erb"})
  end 
end
