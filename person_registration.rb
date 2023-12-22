class KisiKayitProgrami
    def initialize
      @kisiler = []
    end
  
    def kisi_ekle(ad, soyad, telefon, email)
      kisi = { ad: ad, soyad: soyad, telefon: telefon, email: email }
      @kisiler << kisi
      puts "#{ad} #{soyad} kişisi kayıt edildi."
    end
  
    def kisi_guncelle(ad, soyad, yeni_telefon, yeni_email)
      kisi = kisi_bul(ad, soyad)
      if kisi
        kisi[:telefon] = yeni_telefon if yeni_telefon
        kisi[:email] = yeni_email if yeni_email
        puts "#{ad} #{soyad} kişisinin bilgileri güncellendi."
      else
        puts "#{ad} #{soyad} kişisi bulunamadı."
      end
    end
  
    def kisi_sil(ad, soyad)
      kisi = kisi_bul(ad, soyad)
      if kisi
        @kisiler.delete(kisi)
        puts "#{ad} #{soyad} kişisi kayıttan silindi."
      else
        puts "#{ad} #{soyad} kişisi bulunamadı."
      end
    end
  
    def kisileri_listele
      puts "Kişi Kayıtları:"
      @kisiler.each do |kisi|
        puts "Ad: #{kisi[:ad]}, Soyad: #{kisi[:soyad]}, Telefon: #{kisi[:telefon]}, Email: #{kisi[:email]}"
      end
    end
  
    private
  
    def kisi_bul(ad, soyad)
      @kisiler.find { |kisi| kisi[:ad] == ad && kisi[:soyad] == soyad }
    end
  end
  
  kisi_kayit_programi = KisiKayitProgrami.new
  
  loop do
    puts "\nKişi Kayıt Programı"
    puts "1. Kişi Ekle"
    puts "2. Kişi Güncelle"
    puts "3. Kişi Sil"
    puts "4. Kişileri Listele"
    puts "5. Çıkış"
  
    secim = gets.chomp.to_i
  
    case secim
    when 1
      print "Ad: "
      ad = gets.chomp
      print "Soyad: "
      soyad = gets.chomp
      print "Telefon: "
      telefon = gets.chomp
      print "Email: "
      email = gets.chomp
      kisi_kayit_programi.kisi_ekle(ad, soyad, telefon, email)
    when 2
      print "Güncellenecek kişinin Adı: "
      ad = gets.chomp
      print "Güncellenecek kişinin Soyadı: "
      soyad = gets.chomp
      print "Yeni Telefon (Boş bırakmak için Enter): "
      yeni_telefon = gets.chomp
      print "Yeni Email (Boş bırakmak için Enter): "
      yeni_email = gets.chomp
      kisi_kayit_programi.kisi_guncelle(ad, soyad, yeni_telefon, yeni_email)
    when 3
      print "Silinecek kişinin Adı: "
      ad = gets.chomp
      print "Silinecek kişinin Soyadı: "
      soyad = gets.chomp
      kisi_kayit_programi.kisi_sil(ad, soyad)
    when 4
      kisi_kayit_programi.kisileri_listele
    when 5
      puts "Programdan çıkılıyor."
      break
    else
      puts "Geçersiz bir seçim yaptınız. Lütfen tekrar deneyin."
    end
  end