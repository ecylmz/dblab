class ApisController < ApplicationController
  include WashOut::SOAP

  # Simple case
  soap_action "get_product",
              :args   => { :id => :integer },
              :return => { :name => :string , :price => :decimal, :features => :text }
  def get_product
    product = Product.find(params[:id])
    render :soap => {:name => product.name, :price => product.price, :features => product.features}
  end

  # You can use all Rails features like filtering, too. A SOAP controller
  # is just like a normal controller with a special routing.
  before_filter :dump_parameters
  def dump_parameters
    Rails.logger.debug params.inspect
  end
end
