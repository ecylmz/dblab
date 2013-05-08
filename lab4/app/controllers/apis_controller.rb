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

  # SOAP controller için ozel yonlendirmeyi normal controller gibi loglara bas
  before_filter :dump_parameters
  def dump_parameters
    Rails.logger.debug params.inspect
  end
end
