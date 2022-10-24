section "Creating DEMO Tenants" do
  Tenant.create!(name: "Mega City", subdomain: "megacity")
  Tenant.create!(name: "Micro Village", subdomain: "village")
end
