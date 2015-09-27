class LibraryManager
require 'date'
  # 1. Бибилиотека в один момент решила ввести жесткую систему штрафов (прямо как на rubybursa :D).
  # За каждый час опоздания со здачей книги читатель вынужден заплатить пеню 0,1% от стоимости.  
  # Необходимо реализовать метод, который будет считать эту сумму в зависимости от даты выдачи и 
  # текущего времени. По работе с датой-временем информацию можно посмотреть 
  # тут http://ruby-doc.org/stdlib-2.2.2/libdoc/date/rdoc/DateTime.html
  # 
  # Входящие параметры метода 
  # - стоимость книги в центах, 
  # - дата и время возврата (момент, когда книга должна была быть сдана, в формате DateTime)
  # Возвращаемое значение 
  # - пеня в центах
  def penalty price, issue_datetime
   date_now = DateTime.now.new_offset
   price=price.to_i
    price_fine = (price /100*0.1)
    hours =  ((date_now - issue_datetime) * 24 ).to_i
   fine = (hours * price_fine) 
   fine = fine.round
  end


# 2. Известны годы жизни двух писателей. Год рождения, год смерти. Посчитать, могли ли они чисто 
  # теоретически встретиться. Даже если один из писателей был в роддоме - это все равно считается встречей. 
  # Помните, что некоторые писатели родились и умерли до нашей эры - в таком случае годы жизни будут просто 
  # приходить со знаком минус.
  # 
  # Входящие параметры метода 
  # - год рождения первого писателя, 
  # - год смерти первого писателя, 
  # - год рождения второго писателя, 
  # - год смерти второго писателя.
  # Возвращаемое значение 
  # - true или false
  def could_meet_each_other? year_of_birth_first, year_of_death_first, year_of_birth_second, year_of_death_second
    if year_of_birth_first <= year_of_birth_second && year_of_death_first >= year_of_birth_second
       true
     elsif year_of_birth_first >= year_of_birth_second && year_of_death_second >= year_of_death_first
         true
       else
        false
end

  end

  # 3. Исходя из жесткой системы штрафов за опоздания со cдачей книг, читатели начали задумываться - а 
  # не дешевле ли будет просто купить такую же книгу...  Необходимо помочь читателям это выяснить. За каждый 
  # час опоздания со здачей книги читатель вынужден заплатить пеню 0,1% от стоимости.
  # 
  # Входящий параметр метода 
  # - стоимость книги в центах 
  # Возвращаемое значение 
  # - число полных дней, на которые необходимо опоздать со здачей, чтобы пеня была равна стоимости книги.
  def days_to_buy price
    price_fine = (price /100*0.1)
    fine_day = price_fine * 24
    price_book = price / fine_day
    price_book = price_book.round


  end


  # 4. Для удобства иностранных пользователей, имена авторов книг на украинском языке нужно переводить в 
  # транслит. Транслитерацию должна выполняться согласно официальным 
  # правилам http://kyivpassport.com/transliteratio/
  
  # Входящий параметр метода 
  # - имя и фамилия автора на украинском. ("Іван Франко") 
  # Возвращаемое значение 
  # - имя и фамилия автора транслитом. ("Ivan Franko")
  def author_translit ukr_name
    ukr_name=ukr_name.gsub('А','A').gsub('а','a').gsub('Б','B').gsub('б','b').gsub('В','V').gsub('в','v').gsub('Г','H').gsub('г','h').gsub('Ґ','G').gsub('ґ','g').gsub('Д','D').gsub('д','d').gsub('Е','E').gsub('е','e').gsub('Є','Ye').gsub('є','ie').gsub('Ж','Zh').gsub('ж','zh').gsub('З','Z').gsub('з','z').gsub('И','Y').gsub('и','y').gsub('І','I').gsub('і','i').gsub('Ї','Yi').gsub('ї','i').gsub('Й','Y').gsub('й','i').gsub('К','K').gsub('к','k').gsub('Л','L').gsub('л','l').gsub('М','M').gsub('м','m').gsub('Н','N').gsub('н','n').gsub('О','O').gsub('о','o').gsub('П','P').gsub('п','p').gsub('Р','R').gsub('р','r').gsub('С','S').gsub('с','s').gsub('Т','T').gsub('т','t').gsub('У','U').gsub('у','u').gsub('Ф','F').gsub('ф','f').gsub('Х','Kh').gsub('х','kh').gsub('Ц','Ts').gsub('ц','ts').gsub('Ч','Ch').gsub('ч','ch').gsub('Ш','Sh').gsub('ш','sh').gsub('Щ','Shch').gsub('щ','shch').gsub('Ю','Yu').gsub('ю','iu').gsub('Я','Ya').gsub('я','ia')



  end

  #5. Читатели любят дочитывать книги во что-бы то ни стало. Необходимо помочь им просчитать сумму штрафа, 
  # который прийдеться заплатить чтобы дочитать книгу, исходя из количества страниц, текущей страницы и 
  # скорости чтения за час.
  # 
  # Входящий параметр метода 
  # - Стоимость книги в центах
  # - DateTime сдачи книги (может быть как в прошлом, так и в будущем)
  # - Количество страниц в книге
  # - Текущая страница
  # - Скорость чтения - целое количество страниц в час.
  # Возвращаемое значение 
  # - Пеня в центах или 0 при условии что читатель укладывается в срок здачи.
  def penalty_to_finish price, issue_datetime, pages_quantity, current_page, reading_speed
    price= price.to_i
    pages_quantity = pages_quantity.to_i
    current_page = current_page.to_i
    reading_speed= reading_speed.to_i
    date_now = DateTime.now.new_offset
    n_page = pages_quantity - current_page #осталось страниц прочитать
    t_to_reed = n_page / reading_speed # часы, необходимые на прочтение
    hours= ((issue_datetime - date_now) * 24 ) #осталось часов до сдачи
    t_to_return = t_to_reed - hours # лишние часы
    price_fine = (price /100*0.1)

    
if t_to_return > 0
   b_returt = price_fine * t_to_return
    b_returt.round
else 
  b_returt = 0
end
   
    
      
    
  end

end