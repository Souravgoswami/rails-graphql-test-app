PROJECT_TITLES = 10.times.map { rand(5..10).times.map { rand(97..122).chr }.join.capitalize }

SPLIT = 0.4
OFFSET = PROJECT_TITLES.length * SPLIT

PROJECT_USERS = {
	'leo@example.com' => PROJECT_TITLES[0..OFFSET],
	'bob@example.com' => PROJECT_TITLES[0..-1]
}

PROJECT_USERS.each do |email, projects|
	user = User.new(email: email, password: 'secret')
	projects.each { |title| user.projects.build(title: title) }
	user.save
end
