User.
    where(email: 'algaefarmssa@gmail.com').
    first_or_create!(password: 'changeme')

User.
    where(email: 'eirc.eirc@gmail.com').
    first_or_create!(password: 'changeme')
