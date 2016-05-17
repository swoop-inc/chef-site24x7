# api key attribute
default['site24x7']['api_key'] = ""
default['site24x7']['proxy'] = ""

# package identification
if node['kernel']['machine'] == 'i686' || node['kernel']['machine'] == 'i386'
  default['site24x7']['package'] = 'Site24x7_Linux_32bit.install'
else
	default['site24x7']['package'] = 'Site24x7_Linux_64bit.install'
end
