class SoapController < ApplicationController
  include WashOut::SOAP

  # Simple case
  soap_action "get_student",
              :args   => { :id => :integer },
              :return => { :firstname => :string, :lastname => :string, :department => :string, :faculty => :string }
  def get_student
    student = Student.find(params[:id])
    render :soap => { :firstname => student.firstname,
                      :lastname => student.lastname,
                      :department => student.department.name,
                      :faculty => student.department.faculty.name
                    }
  end

  # SOAP controller için ozel yonlendirmeyi normal controller gibi loglara bas
  before_filter :dump_parameters
  def dump_parameters
    Rails.logger.debug params.inspect
  end
end
