import { Page, PageScraper } from './page-scraper.js';
import { ScrapeCallback } from './scraper.js';
import { JSDOM } from 'jsdom';

export enum Realm {
  Shared = 'shared',
  Client = 'client',
  Server = 'server',
  Menu = 'menu',
}

export interface Variable {
  name?: string;
  type: string;
  description: string;
}

export interface Function {
  name: string;
  description?: string;
  
  className?: string;

  arguments?: Variable[];
  returns?: Variable[];
}

export class WikiPage extends Page {
  public realm?: Realm;
  public function?: Function;
}

export const wikiPageSaveReplacer = (key: string, value: any) => {
  if (key === 'childUrls')
    return undefined;
  
  return value;
};

export class WikiPageScraper extends PageScraper<WikiPage> {
  constructor(baseUrl: string) {
    super(baseUrl, (url: string, title: string) => new WikiPage(url, title));
  }

  /**
   * Scrapes a page for its information on GLua functions
   * 
   * @param response The response from the page
   * @param html The HTML content of the request
   * 
   * @returns A list containing only the scraped page
   */
  public getScrapeCallback(): ScrapeCallback<WikiPage> {
    const baseScrapeCallback = super.getScrapeCallback();

    return (response: Response, html: string): WikiPage[] => {
      const pages = baseScrapeCallback(response, html);

      if (pages.length === 0)
        return [];
      
      // There is only one page per response
      const page = pages[0];

      // Do not scrape ~history and ~edit links
      page.childUrls = page.childUrls.filter(url => !url.endsWith('~history') && !url.endsWith('~edit') && this.getTraverseUrl(url) !== false);

      // Get the realm of the page
      const dom = new JSDOM(html);
      const pageContent = dom.window.document.querySelector('#pagecontent') as HTMLElement;

      if (!pageContent) {
        // Skip scraping for more details it if it doesn't have page content
        return [ page ];
      }

      const realmDiv = pageContent.querySelector('div.realm-server, div.realm-client, div.realm-menu') as HTMLElement;

      if (!realmDiv) {
        // Skip scraping for more details it if it is not a function
        return [ page ];
      }

      const isServerRealm = realmDiv.classList.contains('realm-server');
      const isClientRealm = realmDiv.classList.contains('realm-client');
      // const isMenuRealm = realmDiv.classList.contains('realm-menu');
      const isSharedRealm = isServerRealm && isClientRealm;

      page.realm = isSharedRealm ? Realm.Shared : (isServerRealm ? Realm.Server : (isClientRealm ? Realm.Client : Realm.Menu));

      // Get the function name of the page, if it contains : it is a method of a class
      const pageTitle = dom.window.document.querySelector('#pagetitle') as HTMLElement;
      const functionName = pageTitle.textContent!;
      const functionNameParts = functionName.split(':');

      if (functionNameParts.length === 2) {
        page.function = {
          name: functionNameParts[1].trim(),
          className: functionNameParts[0].trim(),
        };
      } else {
        page.function = {
          name: functionName,
        };
      }

      // Function description
      const functionDescription = pageContent.querySelector('.function_description') as HTMLElement;
      page.function.description = functionDescription?.textContent?.trim() ?? '';
      
      // Function arguments
      const functionArguments = pageContent.querySelectorAll('.function_arguments > div') as NodeListOf<HTMLElement>;
      const argumentsArray: Variable[] = [];

      for (const argument of functionArguments) {
        argumentsArray.push(WikiPageScraper.parseVariable(argument));
      }

      page.function.arguments = argumentsArray;

      // Function returns
      const functionReturns = pageContent.querySelectorAll('.function_returns > div') as NodeListOf<HTMLElement>;
      const returnsArray: Variable[] = [];

      for (const _return of functionReturns) {
        returnsArray.push(WikiPageScraper.parseVariable(_return));
      }

      page.function.returns = returnsArray;

      return [ page ];
    };
  }

  private static parseVariable(variable: HTMLElement): Variable {
    const name = variable.querySelector('.name')?.textContent!.trim();
    const type = variable.querySelector('a')!.textContent!.trim();
    const description = variable.querySelector('div')!.textContent!.trim();

    if (name)
      return {
        name,
        type,
        description,
      };

    return {
      type,
      description,
    };
  }
}

export const uselessUrls = new Set([
  'https://wiki.facepunch.com/gmod/Dev_Branch',
  'https://wiki.facepunch.com/gmod/Editing_The_Garry\'s_Mod_Wiki', 
  'https://wiki.facepunch.com/gmod/Beginner_Tutorial_Intro',
  'https://wiki.facepunch.com/gmod/Lua_Editors',
  'https://wiki.facepunch.com/gmod/Updating_Scripts_From_GMod_12_to_GMod_13',
  'https://wiki.facepunch.com/gmod/~recentchanges',
  'https://wiki.facepunch.com/gmod/~unlisted',
  'https://wiki.facepunch.com/gmod/~errors',
  'https://wiki.facepunch.com/gmod/~pagelist',
  'https://wiki.facepunch.com/gmod/Addons',
  'https://wiki.facepunch.com/gmod/Addons_Menu',
  'https://wiki.facepunch.com/gmod/Addons_Usage',
  'https://wiki.facepunch.com/gmod/Command_Line_Parameters',
  'https://wiki.facepunch.com/gmod/ConVars_In_Garrysmod',
  'https://wiki.facepunch.com/gmod/Crash_Reporting',
  'https://wiki.facepunch.com/gmod/Help/FAQ',
  'https://wiki.facepunch.com/gmod/Finding_a_Multiplayer_Game',
  'https://wiki.facepunch.com/gmod/Main_Menu',
  'https://wiki.facepunch.com/gmod/Opening_The_Spawnmenu',
  'https://wiki.facepunch.com/gmod/Quick_Start',
  'https://wiki.facepunch.com/gmod/Spawning_Props',
  'https://wiki.facepunch.com/gmod/The_Context_Menu',
  'https://wiki.facepunch.com/gmod/Using_Tools',
  'https://wiki.facepunch.com/gmod/Using_your_Physgun',
  'https://wiki.facepunch.com/gmod/Tools/Axis',
  'https://wiki.facepunch.com/gmod/Tools/Remover',
  'https://wiki.facepunch.com/gmod/gamemodes/DarkRP',
  'https://wiki.facepunch.com/gmod/gamemodes:PropHunt',
  'https://wiki.facepunch.com/gmod/gamemodes/Sandbox',
  'https://wiki.facepunch.com/gmod/gamemodes/Trouble_In_Terrorist_Town',
  'https://wiki.facepunch.com/gmod/Downloading_a_Dedicated_Server',
  'https://wiki.facepunch.com/gmod/Downloading_Game_Content_to_a_Dedicated_Server',
  'https://wiki.facepunch.com/gmod/Linux_Dedicated_Server_Hosting',
  'https://wiki.facepunch.com/gmod/Loading_URL',
  'https://wiki.facepunch.com/gmod/Mounting_Content_on_a_Dedicated_Server',
  'https://wiki.facepunch.com/gmod/Server_Operator_Rules',
  'https://wiki.facepunch.com/gmod/Steam_Game_Server_Accounts',
  'https://wiki.facepunch.com/gmod/Workshop_for_Dedicated_Servers',
  'https://wiki.facepunch.com/gmod/Update_Preview_Changelog',
  'https://wiki.facepunch.com/gmod/Using_The_Kinect',
  'https://wiki.facepunch.com/gmod/Auto_Refresh',
  'https://wiki.facepunch.com/gmod/Beginner_Tutorial_If_Then_Else',
  'https://wiki.facepunch.com/gmod/Beginner_Tutorial_Tables',
  'https://wiki.facepunch.com/gmod/Beginner_Tutorial_Variables',
  'https://wiki.facepunch.com/gmod/Delays_and_Cooldowns',
  'https://wiki.facepunch.com/gmod/Lua_Error_Explanation',
  'https://wiki.facepunch.com/gmod/Lua_Folder_Structure',
  'https://wiki.facepunch.com/gmod/References',
  'https://wiki.facepunch.com/gmod/Specific_Operators',
  'https://wiki.facepunch.com/gmod/States',
  'https://wiki.facepunch.com/gmod/Custom_Entity_Inputs_And_Outputs',
  'https://wiki.facepunch.com/gmod/Sandbox_Specific_Mapping',
  'https://wiki.facepunch.com/gmod/Common_Weapon_Models',
  'https://wiki.facepunch.com/gmod/Player_Animations',
  'https://wiki.facepunch.com/gmod/Player_model_compilation',
  'https://wiki.facepunch.com/gmod/Player_model_LOD_settings',
  'https://wiki.facepunch.com/gmod/ValveBiped_Bones',
  'https://wiki.facepunch.com/gmod/Entity_Driving',
  'https://wiki.facepunch.com/gmod/Fake_Scripted_Entity_Creation',
  'https://wiki.facepunch.com/gmod/Game_Movement',
  'https://wiki.facepunch.com/gmod/Gamemode_Creation',
  'https://wiki.facepunch.com/gmod/Player_Classes',
  'https://wiki.facepunch.com/gmod/Prediction',
  'https://wiki.facepunch.com/gmod/Prediction_Examples',
  'https://wiki.facepunch.com/gmod/Using_Viewmodel_Hands',
  'https://wiki.facepunch.com/gmod/Addon_Localization',
  'https://wiki.facepunch.com/gmod/Advanced_Chatbox',
  'https://wiki.facepunch.com/gmod/HUD_Element_List',
  'https://wiki.facepunch.com/gmod/Basic_Chatbox',
  'https://wiki.facepunch.com/gmod/Basic_scoreboard_creation',
  'https://wiki.facepunch.com/gmod/CS:S_Kill_Icons',
  'https://wiki.facepunch.com/gmod/Cursors',
  'https://wiki.facepunch.com/gmod/Custom_SpawnMenu',
  'https://wiki.facepunch.com/gmod/Default_Fonts',
  'https://wiki.facepunch.com/gmod/Derma_Basic_Guide',
  'https://wiki.facepunch.com/gmod/Derma_Skin_Creation',
  'https://wiki.facepunch.com/gmod/Drag_and_Drop_for_VGUI',
  'https://wiki.facepunch.com/gmod/Finding_the_Font_Name',
  'https://wiki.facepunch.com/gmod/Grid-Based_Inventory_System',
  'https://wiki.facepunch.com/gmod/Panel_Customization',
  'https://wiki.facepunch.com/gmod/Silkicons',
  'https://wiki.facepunch.com/gmod/Tool_Information_Display',
  'https://wiki.facepunch.com/gmod/VGUI_Element_List',
  'https://wiki.facepunch.com/gmod/NextBot_NPC_Creation',
  'https://wiki.facepunch.com/gmod/Simple_Pathfinding',
  'https://wiki.facepunch.com/gmod/any',
  'https://wiki.facepunch.com/gmod/boolean',
  'https://wiki.facepunch.com/gmod/Chair_Throwing_Gun',
  'https://wiki.facepunch.com/gmod/Console_Command_Auto-completion',
  'https://wiki.facepunch.com/gmod/Console_commands',
  'https://wiki.facepunch.com/gmod/ConVars',
  'https://wiki.facepunch.com/gmod/Controlling_Entity_Transmission',
  'https://wiki.facepunch.com/gmod/Editable_Entities',
  'https://wiki.facepunch.com/gmod/File_Based_Storage',
  'https://wiki.facepunch.com/gmod/function',
  'https://wiki.facepunch.com/gmod/Global_Variables',
  'https://wiki.facepunch.com/gmod/Hook_Library_Usage',
  'https://wiki.facepunch.com/gmod/Ircalladdr_Functions',
  'https://wiki.facepunch.com/gmod/Kinect_developing',
  'https://wiki.facepunch.com/gmod/light_userdata',
  'https://wiki.facepunch.com/gmod/List-Styled_Tables',
  'https://wiki.facepunch.com/gmod/Lua_Hooks_Order',
  'https://wiki.facepunch.com/gmod/Lua_Loading_Order',
  'https://wiki.facepunch.com/gmod/Materials_and_Textures',
  'https://wiki.facepunch.com/gmod/Meta_Tables',
  'https://wiki.facepunch.com/gmod/Metamethods',
  'https://wiki.facepunch.com/gmod/nan',
  'https://wiki.facepunch.com/gmod/Net_Library_Example',
  'https://wiki.facepunch.com/gmod/Net_Library_Usage',
  'https://wiki.facepunch.com/gmod/Networking_Entities',
  'https://wiki.facepunch.com/gmod/nil',
  'https://wiki.facepunch.com/gmod/no_value',
  'https://wiki.facepunch.com/gmod/number',
  'https://wiki.facepunch.com/gmod/Object_Oriented_Lua',
  'https://wiki.facepunch.com/gmod/Patterns',
  'https://wiki.facepunch.com/gmod/proto',
  'https://wiki.facepunch.com/gmod/Tables:_Bad_Habits',
  'https://wiki.facepunch.com/gmod/thread',
  'https://wiki.facepunch.com/gmod/Trigonometry',
  'https://wiki.facepunch.com/gmod/userdata',
  'https://wiki.facepunch.com/gmod/vararg',
  'https://wiki.facepunch.com/gmod/Steam_Workshop_Rules',
  'https://wiki.facepunch.com/gmod/Workshop_Addon_Creation',
  'https://wiki.facepunch.com/gmod/Workshop_Addon_Updating',
  'https://wiki.facepunch.com/gmod/Writing_For_Workshop',
  'https://wiki.facepunch.com/gmod/2D_Rendering_Functions',
  'https://wiki.facepunch.com/gmod/2D_Rendering_Hooks',
  'https://wiki.facepunch.com/gmod/3D_Rendering_Functions',
  'https://wiki.facepunch.com/gmod/3D_Rendering_Hooks',
  'https://wiki.facepunch.com/gmod/BaseAnimatingOverlay',
  'https://wiki.facepunch.com/gmod/Blocked_ConCommands',
  'https://wiki.facepunch.com/gmod/C_Lua:_Functions',
  'https://wiki.facepunch.com/gmod/Calling_net.Start_with_unpooled_message_name',
  'https://wiki.facepunch.com/gmod/Common_Sounds',
  'https://wiki.facepunch.com/gmod/Creating_Binary_Modules:_CMake',
  'https://wiki.facepunch.com/gmod/Creating_Binary_Modules:_Premake',
  'https://wiki.facepunch.com/gmod/Creating_Looping_Sounds',
  'https://wiki.facepunch.com/gmod/Custom_Entity_Fields',
  'https://wiki.facepunch.com/gmod/Default_Ammo_Types',
  'https://wiki.facepunch.com/gmod/Default_Lists',
  'https://wiki.facepunch.com/gmod/Effects',
  'https://wiki.facepunch.com/gmod/Entity_Callbacks',
  'https://wiki.facepunch.com/gmod/File_Search_Paths',
  'https://wiki.facepunch.com/gmod/Game_Events',
  'https://wiki.facepunch.com/gmod/Global_States',
  'https://wiki.facepunch.com/gmod/HL2_Sound_List',
  'https://wiki.facepunch.com/gmod/Hold_Types',
  'https://wiki.facepunch.com/gmod/Lua_Error_Logging',
  'https://wiki.facepunch.com/gmod/Material_Flags',
  'https://wiki.facepunch.com/gmod/Material_Parameters',
  'https://wiki.facepunch.com/gmod/Networking_Usage',
  'https://wiki.facepunch.com/gmod/Post-Processing_Materials',
  'https://wiki.facepunch.com/gmod/Render_Order',
  'https://wiki.facepunch.com/gmod/Scripted_Entities',
  'https://wiki.facepunch.com/gmod/Setting_Visual_Studio_Up_for_Making_Binary_Modules',
  'https://wiki.facepunch.com/gmod/Shaders',
  'https://wiki.facepunch.com/gmod/Vehicle_Scripts_Information',
  'https://wiki.facepunch.com/gmod/Wiki_Search_Tags',
]);