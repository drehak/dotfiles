config.load_autoconfig()

c.fonts.default_family = 'Liberation Mono'

c.content.blocking.hosts.lists.append(str(config.configdir) + '/blockedHosts')

c.tabs.position = 'left'
c.tabs.width = '15%'
c.tabs.show = 'multiple'

c.colors.tabs.bar.bg = '#200020'
c.colors.tabs.even.bg = '#440066'
c.colors.tabs.odd.bg = '#662299'

c.colors.tabs.pinned.even.bg: 'dodgerblue'
c.colors.tabs.pinned.odd.bg: 'deepskyblue'
c.colors.tabs.selected.even.bg: 'black'
c.colors.tabs.selected.odd.bg: 'black'

c.colors.tabs.selected.even.fg: 'gold'
c.colors.tabs.selected.odd.fg: 'gold'
c.colors.tabs.pinned.selected.even.fg: 'gold'
c.colors.tabs.pinned.selected.odd.fg: 'gold'

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
