#!/usr/bin/ruby
#encoding: utf-8

require 'pg'

def connect(dbname)
  PG.connect(dbname: dbname)
end

def student_count(conn)
  conn.exec("select OgrenciSayisi()") do |result|
    result.each do |row|
      puts "Toplam Öğrenci Sayısı: " + row['ogrencisayisi']
    end
  end
end

def new_student(conn, id, name, surname, birthday, address, gsm)
  begin
    conn.exec("select OgrenciKayit('%s','%s','%s',date('%s'),'%s','%s')" % [id, name, surname, birthday, address, gsm])
    puts "Öğrenci Eklendi!"
  rescue PG::Error => err
    puts "%s Öğrenci Eklenirken Hata: %s" % [ err.class.name, err.message ]
  end
end

def main
  conn = connect("lab3")

  student_count(conn)
  puts "\n---\n"
  new_student(conn, "2", "Can", "Yılmaz", "1991-01-01", "Foo Mahallesi Bar Sokak", "123456788")
end

main
