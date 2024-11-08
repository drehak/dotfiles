config.load_autoconfig()

c.fonts.default_family = 'Liberation Mono'
c.fonts.default_size = '9pt'

c.content.blocking.method = 'both'
c.content.blocking.hosts.lists.append(str(config.configdir) + '/blockedHosts')

c.tabs.position = 'left'
c.tabs.width = '15%'
c.tabs.show = 'multiple'
c.tabs.title.format = '{audio}{index}: {current_title}'
c.tabs.title.format_pinned = c.tabs.title.format
c.tabs.last_close = 'close'
c.tabs.pinned.frozen = False
c.tabs.pinned.shrink = True

c.content.javascript.clipboard = 'access'

c.colors.tabs.bar.bg = '#222'
c.colors.tabs.even.bg = '#4e7071'
c.colors.tabs.odd.bg = '#4e7071'

c.colors.tabs.selected.even.bg = '#2e4745'
c.colors.tabs.selected.even.fg = 'white'
c.colors.tabs.selected.odd.bg = '#2e4745'
c.colors.tabs.selected.odd.fg = 'white'

c.colors.tabs.pinned.even.bg = '#ce707e'
c.colors.tabs.pinned.even.fg = 'white'
c.colors.tabs.pinned.odd.bg = '#ce707e'
c.colors.tabs.pinned.odd.fg = 'white'

c.colors.tabs.pinned.selected.even.bg = '#824652'
c.colors.tabs.pinned.selected.even.fg = 'white'
c.colors.tabs.pinned.selected.odd.bg = '#824652'
c.colors.tabs.pinned.selected.odd.fg = 'white'

c.search.incremental = False
c.statusbar.show = 'always'
c.url.start_pages = 'about:blank'

c.bindings.commands = {
    'normal': {
        ',M': 'spawn mpv {url}',
        ',m': 'hint links spawn mpv {hint-url}'
    }
}

# not sure if this even works lol
c.hints.selectors = {
    'all': [
        'a',
        'area',
        'textarea',
        'select',
        'input:not([type="hidden"])',
        'button',
        'frame',
        'iframe',
        'img',
        'link',
        'summary',
        '[onclick]',
        '[onmousedown]',
        '[role="link"]',
        '[role="option"]',
        '[role="button"]',
        '[ng-click]',
        '[ngClick]',
        '[data-ng-click]',
        '[x-ng-click]',
        '[tabindex]'
    ],
    'images': ['img'],
    'inputs': [
        'input[type="text"]',
        'input[type="date"]',
        'input[type="datetime-local"]',
        'input[type="email"]',
        'input[type="month"]',
        'input[type="number"]',
        'input[type="password"]',
        'input[type="search"]',
        'input[type="tel"]',
        'input[type="time"]',
        'input[type="url"]',
        'input[type="week"]',
        'input:not([type])',
        'textarea'
    ],
    'links': ['a[href]', 'area[href]', 'link[href]', '[role="link"][href]'],
    'media': ['audio', 'img', 'video'],
    'url': ['[src]', '[href]']
}
