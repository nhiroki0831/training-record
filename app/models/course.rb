class Course < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択して下さい' },
    { id: 2, name: '16回コース' },
    { id: 3, name: '24回コース' },
    { id: 4, name: '32回コース' },
    { id: 5, name: '48回コース' },
    { id: 6, name: '64回コース' },
    { id: 7, name: '96回コース' },
    { id: 8, name: 'その他' }
  ]
  end