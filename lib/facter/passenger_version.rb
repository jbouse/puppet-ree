Facter.add(:passenger_version) do
  setcode do
    %x{passenger-config --version}.chomp
  end
end
