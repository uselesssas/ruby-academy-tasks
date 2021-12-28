# Описание класса *Router*

#### Суть работы класса *Router* - создать маршруты CRUD для классов *PostsController* и *CommentsController* используя метод *resources*. При инициализации создается пустой хэш для маршрутов.
#### Метод *resources(klass, keyword)* - в переменную *klass* передаём имя класса, в переменную *keyword*  ключ, который будет сопоставляться с значениями хэша.
#### CRUD реализуется через основные методы: *index* и *show* - GET, *create* - POST, *update* - PUT, *destroy* - DELETE.
#### *controller = klass.new* - создаем экзэмпляр класса *klass*, и получаем *controller = PostsController.new*.
#### При вызове метода *resources* с классом *PostsController*, и ключевым словом posts: #<Router:0x0000 @routes={"posts"=> {"GET"=>{"index"=>#<Method: PostsController#index>, "show"=>#<Method: PostsController#show>}, "POST"=>#<Method: PostsController#create>, "PUT"=>#<Method: PostsController#update>, "DELETE"=>#<Method: PostsController#destroy>}}>
#### Получаем первое маршрутное соответствие МАРШРУТ <-> ACTION.
#### Аналогично, вызывая *resources(CommentsController, 'comments')* - получаем все маршруты для comments.
# Пояснение использования *extend Resource*

#### Расширяя классы за счет модуля *Resource*, например *PostsController*, мы получаем следующее: вызываем в цикле *PostsController.connection* (*connection* - метод модуля *Resource*, добавляется как метод класса *PostsController*)
#### В маршруте имеем записи CRUD для *PostsController* и *CommentsController* классов. 
- Спрашиваем у пользователя к какому контроллеру он хочет обратиться 
- Спрашиваем действие для контроллера, который выбрал пользователь - (GET/POST/PUT/DELETE) 
- Сохраняем в переменную *verb*
- Если пользователь выбрал GET, нужно уточнить GET (*index/show*) 
- Сохраняем в переменную *action*
- Используя *verb* и *action* определяем, если *action.nil?*, значит выбрали POST, PUT, DELETE, делаем вызов *routes[verb].call* или *routes[verb][action].call*, то есть формирум вызов *controller.index*