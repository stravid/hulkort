Factory.sequence :repository_name do |n|
  "repository#{n}"
end
Factory.define :commit do |factory|
end

Factory.define :repository do |factory|
  factory.name { Factory.next(:repository_name) }
end