# Приложение Шашлыки

Учебное приложение. Пользователи приложения могут создавать события и звать на них друзей. Также события можно комментировать, подписываться на них, добавлять фотографии.

Приложение написано с помощью `rails 5.1.3`.

Для запуска:

    bundle exec rails db:migrate
    bundle exec rails s
    
В ходе работы на приложением был изучен фреймворк Bootstrap (`gem 'twitter-bootstrap-rails'`), `gem 'devise'` для аутентификации пользователей, `gem 'carrierwave'` для загрузки фотографий, `gem 'fog-aws'` для работы с amazon. Также была реализована работа с почтой.

Посмотреть приложение можно [здесь](https://best-events.herokuapp.com/).
