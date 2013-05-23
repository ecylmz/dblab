# encoding:utf-8
class StudentController < ApplicationController
  def new
    student = Student.new({
      firstname:      params[:firstname],
      lastname:       params[:lastname],
      department_id:  params[:department_id],
    })
    if student.save
      flash[:notice] = "Kaydınız Alınmıştır. Teşekkür Ederiz"
    else
      flash[:error] = "Kaydınız Alınamadı"
    end
  end

  def search
    if params[:id] and params[:id] != ""
      @student = Student.find(params[:id])
    else
      @student = nil
    end
  end

  def search_with_soap
    if params[:id] and params[:id] != ""
      # bir program kendisiyle neden soap ile iletişim kurmak istesin ki?
      # veriler zaten veritabanında mevcut değil mi, gitsin çeksin oradan...
      # Lab 5 föyünde böyle istenmesinden ötürü bu kodu yazmak zorundayım.
      client = Savon::Client.new("http://localhost:3000/soap/wsdl")
      client.http.headers = { "Content-Length" => "0", "Connection" => "Keep-Alive" }
      client.wsdl.soap_actions
      @result = response.to_hash[:get_student_response]
    else
      @result = nil
    end
  end
end
