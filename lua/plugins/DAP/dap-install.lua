local status_ok, dap_installer = pcall(require, "dap-install")
if not status_ok then
  return
end

dap_installer.setup({
  installation_path = "/tmp/test_dap_install/",
  verbosely_call_debuggers = true,
})
