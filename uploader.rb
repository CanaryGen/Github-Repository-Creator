require 'octokit'
require 'fileutils'
require 'yaml'

CONFIG_FILE = 'config.yml'

# Load configuration
config = YAML.load_file(CONFIG_FILE) rescue {}

# Request GitHub token if not saved
if config['access_token'].nil?
  print "Enter your GitHub access token: "
  config['access_token'] = gets.chomp
  File.write(CONFIG_FILE, config.to_yaml)
end

# Initialize Octokit client
client = Octokit::Client.new(access_token: config['access_token'])

# Get current user
user = client.user
user.login

# Request repository name with validation
loop do
  print "Enter the repository name: "
  repo_name = gets.chomp
  if repo_name.match?(/\A[a-zA-Z0-9._-]+\z/)
    break
  else
    puts "Repository name must contain only letters, numbers, dots, dashes, and underscores."
  end
end

# Create repository
repo = client.create_repository(repo_name)

# Folder with files to upload
folder_path = 'repository'

# Create folder if it does not exist
FileUtils.mkdir_p(folder_path) unless Dir.exist?(folder_path)

# Iterate over files in the folder and upload them to the repository
Dir.glob("#{folder_path}/**/*").each do |file_path|
  next if File.directory?(file_path)

  relative_path = Pathname.new(file_path).relative_path_from(Pathname.new(folder_path)).to_s
  content = File.read(file_path)
  client.create_contents(repo.full_name, relative_path, "Add #{File.basename(file_path)}", content)
end

puts "Repository #{repo_name} created and files uploaded."

# Request to clear the folder
print "Do you want to clear the 'repository' folder? (yes/no): "
if gets.chomp.downcase == 'yes'
  FileUtils.rm_rf(Dir.glob("#{folder_path}/*"))
  puts "Folder 'repository' cleared."
else
  puts "Folder 'repository' not cleared."
end
