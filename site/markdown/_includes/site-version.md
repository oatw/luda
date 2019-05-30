<!-- markdownlint-disable -->
<script type="text/javascript">
  window.site = window.site || {}
  window.site.version = "{{ site.luda.siteVersion }}"
  luda.on('docready', function(){
    if(window.site.version != window.site.latestVersion){
      luda.toggle.activate('site-version-alert')
    }
  })
</script>
