class Job < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択して下さい' },
    { id: 2, name: '会社員' },
    { id: 3, name: 'OL' },
    { id: 4, name: '会社役員' },
    { id: 5, name: '自営業' },
    { id: 6, name: '公務員' },
    { id: 7, name: '主婦' },
    { id: 8, name: '学生' },
    { id: 9, name: 'フリーター' },
    { id: 10, name: 'その他' }
  ]
end
