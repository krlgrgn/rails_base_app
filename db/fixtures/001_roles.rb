Role.seed(:id, *%w(
  admin
  user
).map.with_index { |c, i| { id: i + 1, name: c } })
